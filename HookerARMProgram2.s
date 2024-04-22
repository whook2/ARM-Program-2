;	// This program uses Euclid’s algorithm to find the greatest common divisor of two
;	// numbers. Because Euclid’s algorithm only works on positive numbers, first take
;	// the absolute values of both numbers.
;	void euclid (int*, int*, int*)
;	int main()
;	{
;	int x0 = -8;
;	int y0 = 9;
;	int x1 = -295;
;	int y1 = -45;
;	int x2 = 280;
;	int y2 = 8;
;	int x3 = 81;
;	int y3 = -243;
;	int e0, e1, e2, e3;
;	euclid(x0, y0, &e0);
;	euclid(x1, y1, &e1);
;	euclid(x2, y2, &e2);
;	euclid(x3, y3, &e3);
;	}
;	void euclid(int x, int y, int *result)
;	{
;	if x < 0
;	x = -x;
;	if y < 0
;	y = -y;
;	while (x != y)
;	if (x < y)
;	y = y – x;
;	else
;	x = x – y;
;	*result = x;
;	return;
;	}

		AREA EUCLID, CODE, READONLY
		ENTRY
		LDR 	r5, x0		; loads x0
		BL		abs			; branches to abs val
		MOV		r0, r6		; moves the returned val to r0
		LDR 	r5, y0		; loads y0
		BL		abs			; branches to abs val
		MOV		r1, r6		; moves the returned y to r1
		ADR 	r2, e0		; pointer to the allocated space for e0
		
		BL		euclid		; calls function
		
		STR		r0, [r2]	; stores result to the memory address of e0
		LDR 	r5, x1		; loads x1
		BL		abs			; branches to abs val
		MOV		r0, r6		; moves the returned val to r0
		LDR 	r5, y1		; loads y1
		BL		abs			; branches to abs val
		MOV		r1, r6		; moves the returned val to r1
		ADR 	r2, e1		; pointer to the allocated space for e1
		
		BL 		euclid		; calls function
		
		STR		r0, [r2]	; stores result to the memory address of e1
		LDR 	r5, x2		; loads x2
		BL		abs			; branches to abs val
		MOV		r0, r6		; moves the returned val to r0
		LDR 	r5, y2		; loads y2
		BL		abs			; branches to abs val
		MOV		r1, r6		; moves the returned val to r1
		ADR 	r2, e2		; pointer to the allocated space for e2
		
		BL 		euclid		; calls function
		
		STR		r0, [r2]	; stores result to the memory address of e2
		LDR 	r5, x3		; loads x3
		BL		abs			; branches to abs val
		MOV		r0, r6		; moves the returned val to r0
		LDR 	r5, y3		; loads y3
		BL		abs			; branches to abs val
		MOV		r1, r6		; moves the returned val to r1
		ADR 	r2, e3		; pointer to the allocated space for e3
		
		BL 		euclid		; calls function
		
		STR		r0, [r2]	; stores result to the memory address of e3
		B 		done		; branch to end of program		
		
abs		CMP		r5, #0		; compares value to 0
		RSBLT	r6, r5, #0	; if less than, subs from 0 to get the pos num
		MOVGE	r6, r5		; if greater than, returns original number
		BX		lr			; branches to link register
		
euclid	CMP		r0, r1		; compares x and y
		MOVEQ	pc, lr		; if equal, move lr to pc
		SUBLT	r1, r1, r0	; if(x<y) y=y-x
		SUBGE	r0, r0, r1	; else x=x-y
		B		euclid		; branches back to top of function
done	B		done
		AREA EUCLID, DATA, READWRITE
x0		DCD -8
y0		DCD 9
x1		DCD -295
y1		DCD -45
x2		DCD 280
y2		DCD 8
x3		DCD 81
y3		DCD -243
e0		SPACE 4
e1		SPACE 4
e2		SPACE 4
e3		SPACE 4
		END
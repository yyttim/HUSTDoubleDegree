.386
STACK SEGMENT USE16 STACK
	DB 200 DUP(0)
STACK ENDS

DATA SEGMENT USE16
	BUF1 DB 0,1,2,3,4,5,6,7,8,9
	BUF2 DB 10 DUP(0)
	BUF3 DB 10 DUP(0)
	BUF4 DB 10 DUP(0)
DATA ENDS

CODE SEGMENT USE16
	ASSUME CS:CODE,DS:DATA,SS:STACK
START:
	MOV EAX,DATA
	MOV DS,EAX
	MOV ESI,OFFSET BUF1
	MOV ECX,10
	MOV EBX,10
LOPA:
	MOV EAX,[ESI]
	MOV [EDI+10],EAX
	INC EAX
	MOV [ESI+20],EAX
	ADD EAX,3
	MOV [ESI+30],EAX
	INC ESI
	DEC ECX
	JNZ LOPA
	MOV AH,4CH
	INT 21H
CODE ENDS
	END START
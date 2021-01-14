﻿;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Latex setup Sample @@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;--------------------   latex parameter
Latex_Parameter:
	temp_sample_str =`%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`r`n`%@@@@@@@@@ Usepackage @@@@@@@@@`r`n`%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`r`n\documentclass{beamer}`r`n`r`n`%--------------------`r`n`%-- define comment --`r`n`%--------------------`r`n`%\long\def\/*#1*/{}`r`n`%__ define comment __`r`n`%____________________`r`n`r`n`%------------------`r`n`%-- math package --`r`n`%------------------`r`n\usepackage{amssymb,amsmath,stmaryrd} `r`n`%------------------`r`n\usepackage{mathtools}`r`n`%Reference: `r`n`%http://texdoc.net/texmf-dist/doc/latex/mathtools/mathtools.pdf`r`n`%__ math package __`r`n`%__________________`r`n`r`n`r`n`%------------------------------------`r`n`%-- insert {} to multiple folders ---`r`n`%------------------------------------`r`n\graphicspath{{./images/}} `r`n`%__ insert {} to multiple folders ___`r`n`%____________________________________`r`n`r`n`r`n`%------------------`r`n`%-- use chinese ---`r`n`%------------------`r`n\usepackage{CJKutf8}`r`n`%\usepackage{CJK}`r`n`%__ use chinese ___`r`n`%__________________`r`n`r`n`%----------------------`r`n`%-- use draw package --`r`n`%----------------------`r`n\usepackage{tikz}`r`n`%__ use draw package __`r`n`%______________________`r`n`r`n`%========= Usepackage =========`r`n`%==============================`r`n`r`n`%@@@@@@@@@@@@@@@@@@@@@@@@@@@@`r`n`%@@@@@@@@@ Document @@@@@@@@@`r`n`%@@@@@@@@@@@@@@@@@@@@@@@@@@@@`r`n`%------------`r`n`%-- Start ---`r`n`%------------`r`n\begin{document}`r`n\begin{CJK*}{UTF8}{bsmi}`r`n`%__ Start ___`r`n`%____________`r`n`r`n`r`n`r`n`r`n\begin{frame}`r`n\frametitle{Test}`r`n$`r`n$`r`n\end{frame}`r`n`r`n`r`n`r`n`r`n`r`n`%------------`r`n`%-- Finish --`r`n`%------------`r`n\end{CJK*}`r`n\end{document}`r`n`%__ Finish __`r`n`%____________`r`n`r`n`%========= Document =========`r`n`%============================
	clipboard := temp_sample_str
	clipwait, 5
	send, ^v
	send, {space}
	return
	return

;========= Latex setup Sample =========
;======================================




;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Sign Script @@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




;comment definition
latex_Usecomment:
;:?:latex_Usecomment.::
	sendInput, {raw}`%\long\def\/*#1*/{} `%definition comment
	;sendInput, %text%
	return
;;;;;;;;;;;;;;;;;use package;;;;;;;;;;;;;;;;;;;;;;;;;;;
;beamer
beamer:
latex_beamer:
;:?:beamer.::
	sendinput, {raw}\documentclass{beamer}
	return
;article
latex_article:
:?:article.::
	sendinput, {raw}\documentclass{article}
	return
;math notation
latex_usemath:
:?:usemath.::
	sendinput, {raw}\usepackage{amssymb,amsmath,stmaryrd} `%math package
	return
;draw
latex_useDraw:
:?:useDraw.::
	sendinput, {raw}\usepackage{tikz} `%use draw package
	return

;language
latex_usechinese:
:?:usechinese.::
	sendinput, {raw}\usepackage{CJKutf8}`n
	sendinput, {raw}\begin{CJK*}{UTF8}{bsmi}`n
	sendinput, {raw}\end{CJK*}
	return
;;;;;;;use latex_ math $$
latex_mt:
:?:mt.::
	sendinput, {raw}$
	send, {enter}
	sendinput, {raw}$
	send, {up}
	send, {enter}
	return
;--------------------   Bold
bold:
	sendinput, {raw}\textbf{}
	send, {left}
	return
;--------------------   Color
color:
	sendinput, {raw}`% usepackage{xcolor}`n`%{colorName}{Contain}`n\textcolor{}{}
	return
;----------------------------------------   set section
;--------------------   section
section:
	sendinput, {raw}\section{}
	send, {left}
	return
;--------------------   subsection
subsection:
	sendinput, {raw}\subsection{}
	send, {left}
	return
;;;;;;;;;;;;;;;;comment;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; :?:test:: question mark >> the hotstring will be triggered even when it is inside another word.
;;;;;;;;;;;;; frame ;;;;;;;;;;;;;;;;;;;;;;
latex_frame:
:?:frame.::
	sendinput, {raw}\begin{frame}{}`n\end{frame}
	send, {up}
	send, {end}
	send, {enter}
	return
framesplit:	
	sendinput, {raw}\end{frame}`n`n`%--------------------   Split Frame Continue`n`n\begin{frame}
	return
latex_frametitle:
:?:frametitle.::
	sendinput, {raw}\frametitle{}
	send, {left}
	return
;------------
;-- Image ---
;------------
insertimage:
	sendinput, {raw}`%\/*[] > parameters, {} > image name*/`n
	sendinput, {raw}\includegraphics[width=\textwidth]{} 
	send, {left}
	return
;image
latex_useimage:
:?:useimage.::
	sendinput, {raw}\graphicspath{{./}} `%insert {} to multiple folders
	return
;__ Image ___
;____________

;--------------
;-- FUNCTION --
;--------------
equation:
latex_equation_begin_equation:
	sendinput, {raw}\begin{equation}`n	`n\end{equation}
	send, {up}
	return

function:
latex_function_case:
	sendinput, {raw}`%\/********** function ************/`n
	sendinput, {raw}\begin{cases}`n
	sendinput, {raw}\text{}\\`n
	sendinput, {raw}\end{cases}
	send, {up}
	send, {left}
	return
latex_function_case_Sample:
	sendinput, {raw}T(n)=`n\begin{cases}`n	2 & \text{if } n = 2,\\`n	2T(n/2)+n & \text{if } n = 2^k, \text{for } k > 1`n\end{cases}
	return
;------------------------------------
;----- Insert function display ------
;------------------------------------
function2:
latex_function2_[]:
	sendinput, {raw}\[`n`n\]
	send, {up}
	return
function_:
latex_function2_][:
	sendinput, {raw}\]`n`n\[
	send, {up}
	return

;----- Insert function display ------
;____________________________________

;--------------------
;-- Function align --
;--------------------
functionAlign:
latex_functionAlign:
	sendinput, {raw}`%\/*It can not blank before end{align}*/`n`%\/*  & where the equations align*/`n\begin{align*}`n`n\end{align*}
	send,{up}
	return
functionCenterAlign:
latex_functionCenterAlign:
	sendinput, {raw}\begin{gather*}`n`n\end{gather*}
	send, {up}
	return
;__ Function align __
;____________________

;----------------------
;-- FUNCTION SAMPLE ---
;----------------------


;----------------------------
;-- Function align Sample ---
;----------------------------
functionAlignSample:
latex_functionAlignSample:
	sendinput, {raw}========================= Note`nthe ampersand character & determines `nwhere the equations align`n`n===========================`nAligning several equations`n===========================`n\begin{align*} `n2x - 5y &=  8 \\ `n3x + 9y &=  -12`n\end{align*}`n`n===========================`nGrouping and centering equations`n===========================`n\begin{gather*} `n2x - 5y =  8 \\ `n3x^2 + 9y =  3a + c`n\end{gather*} `n`n=========================== reference`nhttps://www.overleaf.com/learn/latex/Aligning`%20equations`%20with`%20amsmath
	send, {space}
	return
;__ Function align Sample ___
;____________________________

;__ FUNCTION SAMPLE ___
;______________________

;__ FUNCTION __
;______________


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Content table @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;--------------------
;-- Content table ---
;--------------------
tableContent:
latex_tableContent:
	sendinput, {raw}`% \section{}`n`% \subsection{}`n\tableofcontents
	return
;__ Content table ___
;____________________


;--------------------------
;-- Content table sample --
;--------------------------
latex_ContentSample:
	sendinput, {raw}Reference:`nhttps://tex.stackexchange.com/questions/198098/how-to-add-the-table-of-contents-to-beamer`n=====================================`n\begin{frame}`n\titlepage `% Print the title page as the first slide`n\end{frame}`n`n\begin{frame}{Overview}`n\tableofcontents`n\end{frame}`n`n`n`%   PRESENTATION SLIDES`n`n\section{xxxx1} `%`n`%------------------------------------------------`n`n\subsection{xx2} `%`n`n\begin{frame}{f1}`nbla bla...`n`n\end{frame}`n`n`%------------------------------------------------`n`n\begin{frame}{f2}`nbla bla`n\end{frame} 
	send, {space}
	return
;__ Content table sample __
;__________________________



;============== Content table ===============
;============================================



;;;;;;;;;;;;; tabular ;;;;;;;;;;;;;;;;;;;;
tabularSample:
latex_tabularSample:
	temp_sample_str =		\frametitle{Graph}`n		`%\/****table****/`n		\begin{tabular}{|p{10cm}|}`n			\hline`n			About formal proof, which following statements is true?`n			`%\/**** ordered lists ****/`n			\begin{enumerate}`n				\item If prodicates form a partial order set, they can be proved by mathematic induction.`n				\item Diagonalization proof can only be applied on finite sets.`n				\item Two sets are equal if and only if they are mutual subsets.`n				\item Equal number of degree-$n$ nodes is sufficient to prove graph isomorphism.`n				\item Halting problem is a contradiction proof of the existence of intractable problems.`n			\end{enumerate}`n			\\`n			\hline`n		\end{tabular}`n
	clipboard := StrReplace(temp_sample_str, "`n", "`r`n")
	clipwait, 5
	send, ^v
	return
tabular:
latex_tabular:
;:?:tr.::
	;comment
	sendinput, {raw}`%\/****table****/`n
	;sendinput, {raw}\begin{tabular}{ccc}`n\end{tabular}
	sendinput, {raw}\begin{tabular}{|p{10cm}|}`n\end{tabular}
	send, {up}
	send, {end}
	send, {enter}
	return
;;;;;;;;;;;;; lists ;;;;;;;;;;;;;;;;;;;;
;unordered lists
latex_listsunorder:
;:?:listsunorder..::
	sendinput, {raw}`%\/**** unordered lists ****/`n
	sendinput, {raw}\begin{itemize}`n\item `n\end{itemize}
	send, {up}
	send, {end}
	return
;ordered lists
latex_listsorder:
;:?:listsorder..::
	sendinput, {raw}`%\/**** ordered lists ****/`n
	sendinput, {raw}\begin{enumerate}`n\item `n\end{enumerate}
	send, {up}
	send, {end}
	return
;;;;;;;;;;;;;;notation;;;;;;;;;;;;;;;;;;;;;;;
;negative
latex_neg:
:?:neg.::
	sendinput, {raw}`%\/*¬(negative)*/`n\neg 
	send, {space}
	return
;if..., then...
ifthen:
latex_ifthen:
;:?:ifthen.::
	sendinput, {raw}`%\/*→(if..., then...)*/`n\to 
	send, {space}
	return
;if and only if
ifandonlyif:
latex_iff:
;:?:iff.::
	sendinput, {raw}`%\/*↔(biconditional)(if and only if)*/`n\leftrightarrow
	send, {space}
	return
;conjunction, disjunction
conjunction:
latex_conjunc:
;:?:conjunc.::
	sendinput, {raw}`%\/*∧(conjunction)(and)*/`n\wedge
	send, {space}
	return
disjunction:
latex_disjunc:
;:?:disjunc.::
	sendinput, {raw}`%\/*∨(disjunction)(or)*/`n\vee
	send, {space}
	return
;xor
xor:
latex_xor:
;:?:xor.::
	sendinput, {raw}`%\/*⊕(xor)*/`n\oplus
	send, {space}
	return
;logically equivaient
logiequ:
latex_logiequ:
;:?:logiequ.::
	sendinput, {raw}`%\/*≡(logically equivaient)*/`n\equiv
	send, {space}
	return
;exists and forall
exists:
latex_exists:
;:?:exists.::
	sendinput, {raw}`%\/*∃(exists)*/`n\exists
	send, {space}
	return
forall:
latex_forall:
;:?:forall.::
	sendinput, {raw}`%\/*∀(forall)*/`n\forall
	send, {space}
	return
notexists:
latex_notexist:
;:?:notexist.::
	sendinput, {raw}`%\/*¬∃(not exists)*/`n\nexists
	send, {space}
	return
;condition
condition:
latex_conditional:
;:?:conditional..::
	sendinput, {raw}`%\/*->(conditional to)*/`n\rightarrow
	send, {space}
	return
;bicondition.::
bicondition:
latex_biconditional:
;:?:biconditional.::
	sendinput, {raw}`%\/*↔(biconditional)*/`n\leftrightarrow
	send, {space}
	return
;not equal to
notequal:
latex_notequ:
;:?:notequ.::
	sendInput, {raw}`%\/*!=(not equal)*/`n\neq
	send, {space}
	return
;less equal, greater equal
lessequal:
latex_lessequ:
;:?:lessequ.::
	sendInput, {raw}`%\/*≤(less equal)*/`n\leq
	send, {space}
	return
greatequal:
latex_greatequ:
;:?:greatequ.::
	sendInput, {raw}`%\/*≥(great equal)*/`n\geq
	send, {space}
	return
;suset
subsetequal:
latex_subsetequof:
;:?:subsetequof.::
	sendInput, {raw}`%\/*⊆(is a subset of)*/`n\subseteq
	send, {space}
	return
notsubsetequal:
latex_notsubsetequ:
;:?:notsubsetequ.::
	sendInput, {raw}`%\/*!⊆(is not a subset of)*/`n\nsubseteq
	send, {space}
	return
subset:
latex_subsetof:
;:?:subsetof.::
	sendInput, {raw}`%\/*⊂(is a proper subset of)*/`n\subset
	send, {space}
	return
;/*
notsubset:
latex_notsubset:
;:?:notsubset.::
	sendInput, {raw}`%\/*⊂(is not a proper subset of)*/`n\not\subset
	send, {space}
	return
*/


;because therefore
because:
latex_because:
;:?:because.::
	sendInput, {raw}`%\/*∵(because)*/`n\because
	return
therefore:
latex_therefore:
;:?:therefore.::
	sendInput, {raw}`%\/*∴(therefore)*/`n\therefore
	return
;line
linebar:
latex_line:
;:?:line..::
	sendInput, {raw}`%\/*line{cm}{pt}*/`n\rule{}{}
	sendInput, {raw}\\
	return
;belong / in
belongto:
latex_belongto:
;:?:belongto.::
	sendInput, {raw}`%\/*∈(belong)(is member of)*/`n\in
	send, {space}
	return
notbelongto:
latex_notbelong:
;:?:notbelong.::
	sendInput, {raw}`%\/*!∈(not belong)(is not member of)*/`n\notin
	send, {space}
	return
	
;dots
dots:
latex_dots:
;:?:dots.::
	sendInput, {raw}`%\/*...(dots)*/`n\cdots
	send, {space}
	return
VerticalDot:
latex_vdot:
;:?:vdot.::
	sendInput, {raw}`%\/*!...(vertical dots)*/`n\vdots
	send, {space}
	return
dot:
latex_dot:
;:?:dot.::
	sendInput, {raw}`%\/*.(dot)*/`n\cdot
	send, {space}
	return
;infinity
infinity:
latex_infinity:
;:?:infinity..::
	sendinput, {raw}`%\/*(infinity)*/`n\infty
	send, {space}
	return
;summation
summation:
	sendinput, {raw}`%\/*(summation)*/`n\sum_{}^{}
	send, {space}
	send, {left 5}
	return
;limits
limits:
latex_limits:
;:?:limits.::
	sendinput, {raw}`%\/*(limits)*/`n\lim_{}
	send, {space}
	send, {left 2}
	return
;emptyset
emptyset:
latex_emptyset:
;:?:emptyset..::
	sendinput, {raw}`%\/*(empty set)*/`n\emptyset
	send, {space}
	return
;overset
overset:
latex_overset:
;:?:overset..::
	sendinput, {raw}`%\/*first bracket overset second one(overset)*/`n\overset{}{}
	return
;====================================================
;====================================================
;====================== set =========================
;===========exampel to union=========================

;====================================================
;====================================================
;power set
PowerSet:
latex_PowerSet:
;:?:PowerSet.::
	sendInput, {raw}`%\/*P()(power set)*/`n\mathcal{P}()
	send, {space}
	return
;set intersection
SetIntersection:
latex_SetIntersection:
;:?:SetIntersection.::
	sendInput, {raw}`%\/*∩(set intersection)*/`n\cap
	send, {space}
	return
;set union
SetUnion:
latex_SetUnion:
;:?:SetUnion.::
	sendInput, {raw}`%\/*∪(set union)*/`n\cup
	send, {space}
	return

;the Boolean powers
BooleanPower:
latex_BooleanPower:
;:?:BooleanPower.::
	sendInput, {raw}`%\/*⊙(boolean power)*/`n\odot
	send, {space}
	return
;epsilon
Epsilon:
latex_Epsilon:
;:?:Epsilon.::
	sendInput, {raw}`%\/*(Epsilon)*/`n\epsilon
	send, {space}
	return
;composition of
CompositionOf:
latex_CompositionOf:
;:?:CompositionOf.::
	sendInput, {raw}`%\/*◦(composition of)*/`n\circ
	send, {space}
	return
;matrix
matrix:
latex_matrix:
;:?:matrix..::
	sendinput, {raw}`%\/********** matrix *************/`n
	sendinput, {raw}\begin{bmatrix}`n
	sendinput, `%\/*for instance: 1 & 2 \\*/`n
	sendinput, {raw}\end{bmatrix}
	send, {up}
	return

;pmatrix
pmatrix:
latex_pmatrix:
;:?:pmatrix;.::
	sendinput, {raw}`%\/********** matrix *************/`n
	sendinput, {raw}\begin{pmatrix}`n
	sendinput, `%\/*for instance: 1 & 2 \\*/`n
	sendinput, {raw}\end{pmatrix}
	send, {up}
	return

;determinant
determinant:
latex_determin:
;:?:determin..::
	sendinput, {raw}`%\/********** determinant *************/`n
	sendinput, {raw}\begin{vmatrix}`n
	sendinput, `%\/*for instance: 1 & 2 \\*/`n
	sendinput, {raw}\end{vmatrix}
	send, {up}
	return
;division
division:
latex_division:
;:?:division..::
	sendinput, {raw}`%\/*a|b(a divides b)*/`n\mid
	send, {space}
	return
notdivision:
latex_notdiv:
;:?:notdiv.::
	sendinput, {raw}`%\/*a !| b(a does not divide b)*/`n\nmid
	send, {space}
	return


;--------------------   footnote
footnote:
latex_footnote:
	sendinput, {raw}\footnote{}
	return


;--------------
;-- Binomial --
;--------------
binomial:
latex_binomial:
	sendinput, {raw}`%\/*{up}[down]*/`n\binom{}{}
	send, {left 3}
	return
;__ Binomial __
;______________

;--------------
;-- Fraction --
;--------------
fraction:
latex_fraction:
	sendinput, {raw}`%\/*{up}{down}*/`n\frac{}{}
	send, {left 3}
	return
;__ Fraction __
;______________

;----------
;-- math --
;----------

;----------------------------------------   ceil
cl:
latex_ceil:
	sendinput, {raw}\lceil \rceil
	send, {left 7}
	return
fl:
latex_floor:
	sendinput, {raw}\lfloor \rfloor
	send, {left 8}
	return
;__ math __
;__________


;====================================================
;====================================================
;=================== example ========================
;====================================================
;====================================================
contrapositionSample:
latex_contrapositionSample:
;:?:contraposition;.::
	sendinput, {raw}`%\/*example*/`n
	sendinput, {raw}`%\/*  !q -> !p  */`n
	return
converseSample:
latex_converseSample:
;:?:converse;.::
	sendinput, {raw}`%\/*example*/`n
	sendinput, {raw}`%\/*  q -> p  */`n
	return
inverseSample:
latex_inverseSample:
;:?:inverse;.::
	sendinput, {raw}`%\/*example*/`n
	sendinput, {raw}`%\/*  !p -> !q  */`n
	return


;___________________ example ________________________

;====================================================




;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Latex Draw @@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
useArrow:
latex_useArrow:
;------------------
;-- Use comment ---
;------------------
	sendinput, {raw}`%`n
	sendinput, {raw}`%\foreach \name/\angle in {P1/45, P2/135, P3/225, P4/315}`n
	sendinput, {raw}`%{`n
	sendinput, {raw}`%\node[vertex] (\name) at (\angle:1cm) {$\name$};`n
	sendinput, {raw}`%}`n
	sendinput, {raw}`%\foreach \from/\to in {2/3, 1/2, 4/2, 1/4, 3/4, 4/3}`n
	sendinput, {raw}`%{`n
	sendinput, {raw}`%\draw[->] (P\from) -- (P\to);`n
	sendinput, {raw}`%}`n
	sendinput, {raw}`%\draw[->] (P1) to [out=-30, in=30, looseness=8] (P1);`n
;__ Use comment ___
;__________________

;------------------------------
;-- use arrow parameter code --
;------------------------------
	sendinput, {raw}\begin{tikzpicture}[>=stealth]`n
	sendinput, {raw}\tikzstyle{vertex} = [circle, draw=black, minimum size=17pt, inner sep=0pt, font=\fontsize{9pt}{0}]`n
	sendinput, {raw}\end{tikzpicture}
;__ use arrow parameter code __
;______________________________
	return


;--------------------------
;-- Draw ball and arrow ---
;--------------------------
latex_Ball:
	InputBox, number_of_ball, Number of balls,Enter number.,,220, 140
	if number_of_ball is number
	{
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; parameter
		sendinput, {raw}\begin{tikzpicture}[>=stealth]`n
		sendinput, {raw}\tikzstyle{vertex} = [circle, draw=black, minimum size=17pt, inner sep=0pt, font=\fontsize{9pt}{0}]`n
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		all_ball_string := ""
		def_ball_arrow := ""
		ball_angle := Floor(360/number_of_ball)
		;;;;;;;;;;;;;;;;;;;; arrow itself
		itself_arrow := Floor(ball_angle/2)
		;;;;;;;;;;;;;;;;;;;
		loop, % number_of_ball
		{
			ball_point = P%A_Index%
			now_ball_angle := Floor(ball_angle*A_Index)
			ball_point = %ball_point%/%now_ball_angle%
			;;;;;;;;;;;; add comma
			if(number_of_ball != A_Index){ 
				ball_point = %ball_point%,
			}
			;;;;;;;;;;;;;;;;;;;;;;;
			all_ball_string = %all_ball_string% %ball_point%
		}

		;;;;;;;;;;;;;;;;;;;; arrow itself
		def_ball_arrow = %def_ball_arrow% \def\ballAngleUnit{{}%ball_angle%{}}`n
		def_ball_arrow = %def_ball_arrow% \def\ballAngleMove{{}%itself_arrow%{}}`n
		;;;;;
		sendinput, %def_ball_arrow%`n
		;;;;;;;;;;;;;;;;;;;;

		sendinput, {raw}\foreach \name/\angle in {
		sendinput, %all_ball_string%
		
		sendinput, {raw}}`n
		sendinput, {raw}{`n
		sendinput, {raw}\node[vertex] (\name) at (\angle:2cm) {$\name$};`n
		sendinput, {raw}}`n
		sendinput, {raw}`%\draw[->] (P\from) to[bend right=30] (P\to);
		sendinput, {raw}`n`n
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; end parameter
		sendinput, {raw}\end{tikzpicture}
		send,{up}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; end parameter
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; whether draw arrow
	Msgbox, 4,Checking arrow, Do you want to arrow ball?
	IfMsgbox Yes
	{
		gosub, latex_Arrow
	}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	}
	else{
		tooltip, Failure.`nPlease enter number.
		sleep, 2000
		tooltip
		return
	}
	return
latex_Arrow:
	sendinput, {raw}\foreach \from/\to in {}`n
	sendinput, {raw}{`n
	sendinput, {raw}\ifx\from\to`n
	;sendinput, {raw}\draw[->] (P\from) to [out=60, in=120, looseness=8] (P\to);`n
	sendinput, {raw}\draw[->] (P\from) to [out=\ballAngleUnit*\from-\ballAngleMove, in=\ballAngleUnit*\from+\ballAngleMove, looseness=8] (P\to);`n
	sendinput, {raw}\else`n
	sendinput, {raw}\draw[->] (P\from) -- (P\to);`n
	sendinput, {raw}\fi`n
	sendinput, {raw}}
	send, {up 7}
	send, {end}
	send, {left}
	return
;__ Draw ball and arrow ___
;__________________________

;========= Latex Draw =========
;==============================



;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Latex Draw Sample @@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
insertDrawSample:
latex_insertDrawSample:
	sendinput, {raw}\usepackage{tikz}`n`n\begin{tikzpicture}[scale=1.5]`n`% Draw thin grid lines with color 40`% gray + 60`% white`n\draw [step=0.5,thin,gray!40] (-1.4,-1.4) grid (1.4,1.4);`n`n`% Draw x and y axis lines`n\draw [->] (-1.5,0) -- (1.5,0) node [below] {$x$};`n\draw [->] (0,-1.5) -- (0,1.5) node [left] {$y$};`n`n`% Draw a blue circle at the origin of radius 1`n\draw [semithick,blue] (0,0) circle (1);`n`n`% Draw a triangle with vertices (0,0), (1,0), (1,0.7)`n\draw [semithick,blue] (0,0) -- (1,0) -- (1,0.7) -- cycle;`n\end{tikzpicture}
	send, {space}
;------------------
;-- OLD VERSION ---
;------------------
/*
	sendinput, {raw}\begin{tikzpicture}[scale=1.5]`n
	sendinput, {raw}`% Draw thin grid lines with color 40`% gray + 60`% white`n
	sendinput, {raw}\draw [step=0.5,thin,gray!40] (-1.4,-1.4) grid (1.4,1.4);`n`n
	sendinput, {raw}`% Draw x and y axis lines`n
	sendinput, {raw}\draw [->] (-1.5,0) -- (1.5,0) node [below] {$x$};`n
	sendinput, {raw}\draw [->] (0,-1.5) -- (0,1.5) node [left] {$y$};`n`n
	sendinput, {raw}`% Draw a blue circle at the origin of radius 1`n
	sendinput, {raw}\draw [semithick,blue] (0,0) circle (1);`n`n
	sendinput, {raw}`% Draw a triangle with vertices (0,0), (1,0), (1,0.7)`n
	sendinput, {raw}\draw [semithick,blue] (0,0) -- (1,0) -- (1,0.7) -- cycle;`n
	sendinput, {raw}\end{tikzpicture}
*/
;__ OLD VERSION ___
;__________________
	return


insertDrawBlankSample:
latex_insertDrawBlankSample:
	sendinput, {raw}`%\/*Sample*/`n`%/*\draw [step=0.5,thin,gray!40] (-1.4,-1.4) grid (1.4,1.4);*/`n`%/*\draw [->] (-1.5,0) -- (1.5,0) node [below] {$x$};*/`n`%/*\draw [semithick,blue] (0,0) circle (1);*/`n`%/*\draw [semithick,blue] (0,0) -- (1,0) -- (1,0.7) -- cycle;*/`n`n\usepackage{tikz}`n`n\begin{tikzpicture}[scale=1.5]`n\draw []()(){}`n\end{tikzpicture}
	send, {space}
;------------------
;-- OLD VERSION ---
;------------------
/*
									\begin{tikzpicture}[scale=1.5]
									% Draw thin grid lines with color 40% gray + 60% white
									\draw [step=0.5,thin,gray!40] (-1.4,-1.4) grid (1.4,1.4);

									% Draw x and y axis lines
									\draw [->] (-1.5,0) -- (1.5,0) node [below] {$x$};
									\draw [->] (0,-1.5) -- (0,1.5) node [left] {$y$};

									% Draw a blue circle at the origin of radius 1
									\draw [semithick,blue] (0,0) circle (1);

									% Draw a triangle with vertices (0,0), (1,0), (1,0.7)
									\draw [semithick,blue] (0,0) -- (1,0) -- (1,0.7) -- cycle;
									\end{tikzpicture}
*/

	; Sample
/*
	sendinput, {raw}`%\/*Sample*/`n
	sendinput, {raw}`%/*\draw [step=0.5,thin,gray!40] (-1.4,-1.4) grid (1.4,1.4);*/`n
	sendinput, {raw}`%/*\draw [->] (-1.5,0) -- (1.5,0) node [below] {$x$};*/`n
	sendinput, {raw}`%/*\draw [semithick,blue] (0,0) circle (1);*/`n
	sendinput, {raw}`%/*\draw [semithick,blue] (0,0) -- (1,0) -- (1,0.7) -- cycle;*/`n
	;;;;;;;;;;;;;;;;
	sendinput, {raw}\begin{tikzpicture}[scale=1.5]`n\draw []()(){}`n\end{tikzpicture}
*/
;__ OLD VERSION ___
;__________________

	return
;----------------------------------------
;-- arrow reference code, pdf, and url --
;----------------------------------------
latex_ArrowSample:
	FileRead, latex_arrow, ..\Script\string\latex\tikz_sample\arrow\arrow_itself.txt
	clipboard := latex_arrow
	send, ^v
	sleep, 1000
	run, ..\Script\string\latex\tikz_sample\arrow\arrow_itself.pdf
	run, https://tex.stackexchange.com/questions/45806/tikzpicture-how-can-i-draw-a-loop-right-below
	return
;__ arrow reference code, pdf, and url __
;________________________________________


;========= Latex Draw Sample ==========
;======================================



;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Cancel Package @@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




;--------------------------------------
;-- New command step by step sample ---
;--------------------------------------
latex_CancelStepbyStepSample:
	temp_sample_str =using "cancel" package to new command`nstep by step`n<number-> mean step`n{contents}`n`n\xxcancel<2->{}`n`n-------------------`n--- New comment ---`n-------------------`n//   \xcancel can be change`n`n\newcommand<>{\xxcancel}[1]{\alt#2{\xcancel{#1}\vphantom{#1}}{#1}}`n`n`n-__ New comment ___`n-__________________`n`n-------------------`n--- Use package ---`n-------------------`n`n\usepackage{amsmath}`n\usepackage{cancel}`n`n-__ Use package ___`n-__________________`n`n`n=============================  code`n`n\documentclass{beamer}`n\usepackage{amsmath}`n\usepackage{cancel}`n\newcommand<>{\xxcancel}[1]{\alt#2{\xcancel{#1}\vphantom{#1}}{#1}}`n\begin{document}`n`n\begin{frame}`n    \begin{multline*}`n        S(1,\dots,s) = \underbrace{\sum_{m=1}^{m_t} (-1)^{m+1} \sum_{i_1<\dots<i_m} I(i_1,\dots,i_m)}_{\text{entropy estimate with correlation order}\, m_t} \\`n        \xxcancel<2->{{} + \underbrace{\sum_{m=m_t+1}^{s} (-1)^{m+1} \sum_{i_1<\dots<i_m} I(i_1,\dots,i_m)}_{\text{correlations of order higher than}\, m_t} }`n    \end{multline*}`n\end{frame}`n`n\end{document} 
	clipboard := StrReplace(temp_sample_str, "`n", "`r`n")
	clipwait, 5
	send, ^v
	send, {space}
	return
;__ New command step by step sample ___
;______________________________________





;========= Cancel Package =========
;==================================



;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Bibliography @@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
latex_Bible:
	sendinput,{raw}`%\/*\bibitem{##cite{}##} ##Source##*/`n
	sendinput,{raw}\begin{thebibliography}{9}`n
	sendinput,{raw}\bibitem{}`n
	sendinput,{raw}\end{thebibliography}`n
	send, {up 2}
	send, {end}
	send, {left}
	return
;========= Bibliography =========
;================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Bibliography Sample @@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
latex_BibleSample:
	sendinput,{raw}\cite{###}`n
	sendinput,{raw}\begin{thebibliography}`n
	sendinput,{raw}\bibitem{###}****`n
	sendinput,{raw}\end{thebibliography}`n
	return
;========= Bibliography Sample ==========
;========================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Add pdf @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
latex_Pdfusepackage:
	sendinput, {raw}\usepackage{pdfpages}
	return
latex_Addpdf:
	sendinput, {raw}`%--------------------   beamer blank solved`n\setbeamercolor{background canvas}{bg=} `n`%--------------------   add pdf, option`n\includepdf[pages=-]{.pdf}
	send, {left 5}
	return
;============== Add pdf ===============
;======================================



;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ URL @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;----------------
;-- URL script --
;----------------
latex_Href:
	sendinput, {raw}\href{}{\beamergotobutton{Link}}
	send, {left 26}
	return


;__ URL script __
;________________





;----------------
;-- URL Sample --
;----------------


;--------------------   href
latex_HrefSample:
	sendinput, {raw}\href{http://tex.stackexchange.com/q/20800/5701}{\beamergotobutton{Link}}
	return






;__ URL Sample __
;________________

;============== URL ===============
;==================================






;========= Sign Script ==========
;================================















;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Problem Solved Sample @@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;------------------------------------------
;-- The beamer add pdf(solve pdf blank) ---
;------------------------------------------
latex_SolveBeamerAddPdfWhite:
	sendinput, {raw}\setbeamercolor{background canvas}{bg=}`n`n===================================`nNow, this directory have "test2.pdf"`n`nTo make "test.tex" with "test2.pdf" "output test.pdf"`n`n\usepackage{pdfpages}`n`n\setbeamercolor{background canvas}{bg=} `%This is important to solve text whited.`n\includepdf[pages=-]{test.pdf}  `%add all pdf`n`%or `n`%\includepdf[pages={1,5}]{test.pdf} `%add page 1 and 5
	return
;__ The beamer add pdf(solve pdf blank) ___
;__________________________________________



;========= Problem Solved Sample ==========
;==========================================

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@ Tree @@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;------------------
;-- Tree Sample ---
;------------------
latex_TreeSample:
	sendinput, {raw}\begin{tikzpicture}`n	\node{test}`n		child {node {test1}`n			child {node {test3}}`n			child {node {test4}}`n		}`n		child {node {test2}};`n\end{tikzpicture}
	send, {space}
	return
;__ Tree Sample ___
;__________________

;============== Tree ==============
;==================================



#include "views/common_header.tpl"

<div class="well">



<h1>Results for BIN: <result>$bin</result></h1>

<hr/>

#if $metab:
<h2>Target Genetic Map Location</h2>
<div class="table-responsive">
	<table class="table table-bordered">
		<tr class="info"><th>Bin name</th><th>Metabolite (QML)</th><th>QTL</th></tr>
		<tr><td>$markers2[0]</td><td>$markers2[1]</td><td>$markers2[2]</td></tr>
	</table>
</div>
<hr/>
#end if

#if len($miranda_ss)>=2:
<h2>Predicted targets</h2>
#else
<h2>Predicted target</h2>
#end if
<p></p>


#for $m in $miranda_ss:
#set $target = $m[2]
<table class="table table-bordered">

<tr><th class="info">Micro name</th><td><a href="/microResult/$m[1]">$m[1]</a></td></tr>
<tr><th class="info">Target name</th><td><a href="/targetResult/$m[2]">$m[2]</a></td></tr>
<tr><th class="info">Micro position</th><td>$m[3] to $m[4]</td></tr>
#if $fromto:
<tr><th class="info">Target position</th><td>$m[5] to $m[6]</td></tr>
#end if
#if $C_alig:
<tr><th class="info">Alignment</th><td><img src="/static/imgs/aligns/align-${m[0]}.png" width=500 height=80 alt="alignment" /></td></tr>
#end if
<tr><th colspan="2" class="warning">Gene annotation</th></tr>
<tr><th class="info">Augustus gene prediction</th>
<td>
#if $m[12]==1:
Yes
#else
No
#end if
</td></tr>
<tr><th class="info">Genome threather vs SGN unigenes supporting alignment</th>
<td>
#if $m[14]:
$m[14]
#else
N/A
#end if
</td>
</tr>
#if $C_hitDef:
<tr><th class="info">Arabidopsis peptide alignment (Blast x)</th>
<td>
#if $m[13]:
$m[13]
#else
N/A
#end if
</td>
</tr>
#if $target.startswith('SGN-'):
<tr><th class="info">SGN Unigene annotation</th>
<td>
#if $m[15]:
$m[15]
#else
No significant hits detected for this target or not run.
#end if
</td></tr>
#else
<tr><th class="info">MicroRNA precursor alignment</th><td>
#if $m[0] in $queryname
#for $q in $queryname[$m[0]]
<p>
#* m0 y q: $m[0] $q *#
Putative function precursor 
#if $numero == 0
$q[5]
#else
<b>ERROR (dato: mirna?)</b>
#* $mirna *#
#end if
<br />
parid: $q[0]<br />
e: $q[1]<br />
Ident: $q[2]%<br />
Bit: $q[3]<br />
Alignment: $q[4]<br />
</p>
#end for
#else
N/A
#end if
</td></tr>
#end if
#end if

#if $C_exp:
#set $expname = $m[2] + '.png'
#if $expname in $expression_s:
<tr><td>Expression</td><td><img src="/static/imgs/exp/${expname}" alt="expression data" /></td></tr>
#end if
#end if

</table>
<p>
<hr>
</p>
#end for
<hr />

#if $C_xls:
Excel dump: <a href="/static/xls/tmpbins/${bin}.xls">$bin</a>
#end if


</div>
#include "views/common_footer.tpl"

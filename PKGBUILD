# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgbase=pars-win
pkgname=('nona-win' 'pee-wee' 'xpiwe' 'slf-wt' 'spa' 'phast-win' 'pars-win-extra')
pkgver=2014.03.10
pkgrel=0
pkgdesc="free parsimony programs"
arch=('x86_64')
url="https://www.lillo.org.ar/phylogeny/Nona-PeeWee/readme.htm"
license=('custom')
makedepends=('unrar' 'dosbox' 'wine')
source=(https://www.lillo.org.ar/phylogeny/Nona-PeeWee/Pars-win.exe)
sha256sums=('89a5eeaeef53aefbefdc9a7344b5b0e996ed1465987452045297d03d89126fce')

build(){
  cd $srcdir
  # extract files
  unrar x Pars-win.exe
  # write verify.bat 
  cat << EOF > verify.bat
wconvert winona yatasto BioArchLinux
wconvert winpiwe yatasto BioArchLinux
wconvert winxpiwe yatasto BioArchLinux

wconvert winspa BODEGON BioArchLinux
wconvert winphast BODEGON BioArchLinux

wconvert winsl surubies BioArchLinux

exit
EOF
  # verify
  env SDL_VIDEODRIVER=dummy wine verify.bat
  # generate pkg shell
  echo "cd /usr/share/pars-win" > basic
for EXE in ONA  PHAST  PIWE  SL  SPA  XPIWE
do
  cp basic WIN$EXE
  echo "wine WIN$EXE.EXE" >> WIN$EXE
  chmod +x WIN$EXE 
done
  # two basic dos programs
for EXE in CONS FQ SCG
do
  echo "dosbox /usr/share/$pkgbase/$EXE.EXE" >> $EXE
  chmod +x $EXE 
done
}

package_nona-win(){
  depends=('wine' 'bash')
  pkgdesc="a  bastard  son  of  Pee-Wee"
  cd $srcdir
  _pkg=ONA
  _doc=NONA
  # install main
  install -Dm 755 WIN$_pkg.EXE $pkgdir/usr/share/$pkgbase/WIN$_pkg.EXE
  install -Dm 644 $_doc.DOC $pkgdir/usr/share/$pkgbase/$_doc.DOC
  # install shell 
  install -Dm 755 WIN$_pkg $pkgdir/usr/bin/WIN$_pkg 
  # install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgbase
  ln -s /usr/share/$pkgbase/$_doc.DOC $pkgdir/usr/share/doc/$pkgbase/$_doc.DOC
}

package_pee-wee(){
  depends=('wine' 'bash')
  pkgdesc="(P)arsimony and (I)mplied (WE)ights"
  provides=('pee-wee' 'piwe')
  cd $srcdir
  _pkg=PIWE
  _doc=$_pkg
  # install main
  install -Dm 755 WIN$_pkg.EXE $pkgdir/usr/share/$pkgbase/WIN$_pkg.EXE
  install -Dm 644 $_doc.DOC $pkgdir/usr/share/$pkgbase/$_doc.DOC
  # install shell 
  install -Dm 755 WIN$_pkg $pkgdir/usr/bin/WIN$_pkg 
  # install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgbase
  ln -s /usr/share/$pkgbase/$_doc.DOC $pkgdir/usr/share/doc/$pkgbase/$_doc.DOC
}

package_xpiwe(){
  depends=('wine' 'bash')
  pkgdesc="Pee-Wee with Floating Point Precision"
  cd $srcdir
  _pkg=XPIWE
  _doc=$_pkg
  # install main
  install -Dm 755 WIN$_pkg.EXE $pkgdir/usr/share/$pkgbase/WIN$_pkg.EXE
  install -Dm 644 $_doc.DOC $pkgdir/usr/share/$pkgbase/$_doc.DOC
  # install shell 
  install -Dm 755 WIN$_pkg $pkgdir/usr/bin/WIN$_pkg 
  # install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgbase
  ln -s /usr/share/$pkgbase/$_doc.DOC $pkgdir/usr/share/doc/$pkgbase/$_doc.DOC
}

package_slf-wt(){
  depends=('wine' 'bash')
  pkgdesc="A prototype program implementing character state reconstructions under non-lineal functions of the state changes \
  (Pee-Wee with SeLF-WeighTed) \
  https://doi.org/10.1006/clad.1997.0043"
  cd $srcdir
  _pkg=SL
  _doc=$_pkg
  # install main
  install -Dm 755 WIN$_pkg.EXE $pkgdir/usr/share/$pkgbase/WIN$_pkg.EXE
  install -Dm 644 $_doc.DOC $pkgdir/usr/share/$pkgbase/$_doc.DOC
  # install shell 
  install -Dm 755 WIN$_pkg $pkgdir/usr/bin/WIN$_pkg 
  # install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgbase
  ln -s /usr/share/$pkgbase/$_doc.DOC $pkgdir/usr/share/doc/$pkgbase/$_doc.DOC
}

package_spa(){
  depends=('wine' 'bash')
  pkgdesc="Sankoff Parsimony Analysis \
  https://doi.org/10.1006/clad.1998.0068"
  cd $srcdir
  _pkg=SPA
  _doc=$_pkg
  # install main
  install -Dm 755 WIN$_pkg.EXE $pkgdir/usr/share/$pkgbase/WIN$_pkg.EXE
  install -Dm 644 $_doc.DOC $pkgdir/usr/share/$pkgbase/$_doc.DOC
  # install shell 
  install -Dm 755 WIN$_pkg $pkgdir/usr/bin/WIN$_pkg 
  # install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgbase
  ln -s /usr/share/$pkgbase/$_doc.DOC $pkgdir/usr/share/doc/$pkgbase/$_doc.DOC
}

package_phast-win(){
  depends=('wine' 'bash')
  pkgdesc="PHylogenetic Analysis for Sankoff Transformations \
  https://doi.org/10.1006/clad.1998.0068"
  provides=('phast')
  cd $srcdir
  _pkg=PHAST
  _doc=$_pkg
  # install main
  install -Dm 755 WIN$_pkg.EXE $pkgdir/usr/share/$pkgbase/WIN$_pkg.EXE
  install -Dm 644 $_doc.DOC $pkgdir/usr/share/$pkgbase/$_doc.DOC
  # install shell
  install -Dm 755 WIN$_pkg $pkgdir/usr/bin/WIN$_pkg
  # install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgbase
  ln -s /usr/share/$pkgbase/$_doc.DOC $pkgdir/usr/share/doc/$pkgbase/$_doc.DOC
}

package_pars-win-extra(){
  depends=('dosbox' 'bash')
  pkgdesc="Parsimony programs extra software from Pablo A. Goloboff"
  cd $srcdir
  # install shell and main 
  for EXE in CONS FQ SCG
do
  install -Dm 755 $EXE $pkgdir/usr/bin/$EXE
  install -Dm 755 $EXE.EXE $pkgdir/usr/share/$pkgbase/$EXE.EXE
done
  # install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgbase
  for DOC in PROGRAMS.DOC "README_!.DOC"
do
  install -Dm 644 $DOC $pkgdir/usr/share/$pkgbase/$DOC
  ln -s /usr/share/$pkgbase/$DOC $pkgdir/usr/share/doc/$pkgbase/$DOC
done
  # run
for RUN in $(ls *.RUN)
do
  install -Dm 644 $RUN $pkgdir/usr/share/$pkgbase/scripts/$RUN
done
  # dat
for DAT in $(ls *.DAT)
do
  install -Dm 644 $DAT $pkgdir/usr/share/$pkgbase/data/$DAT
done

}

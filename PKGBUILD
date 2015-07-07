# Maintainer: Eric Waller <ewwaller@gmail.com>
pkgname=hpgcc
pkgver=2.0_sp2
pkgrel=3
pkgdesc="gcc C Compiler for HP 48,49,50 Calculators"
arch=('i686' 'x86_64')
url="http://hpcalc.org"
license=('GPL')
groups=(users)
depends=()
makedepends=('make' 'gcc' 'doxygen')
source=(http://www.hpcalc.org/hp49/pc/programming/$pkgname-${pkgver/_/-}-linux.tar.bz2
        examples_benchmarks_Makefile.diff 
        examples_decnumber_matrix_Makefile.diff 
        examples_decnumber_sqrt2_Makefile.diff  
        examples_hump_Makefile.diff
        examples_decnumber_Chudnovsky_Makefile.diff 
        examples_decnumber_RSA_Makefile.diff 
	examples_games_Makefile.diff 
	examples_Makefile.diff
       )

options=('!strip' 'staticlibs')

md5sums=('4dfe57bffc79eaf966a1c2bed06ea502'
         'fec5f59cf1520a0a5618e37fd16884ee'
         '11cd6fb8df17350cd5558031c66ac7e8'
         '11cd6fb8df17350cd5558031c66ac7e8'
         'fec5f59cf1520a0a5618e37fd16884ee'
         '9ff5a19476c74769ba91244a259c89f0'
         'db40758d8c4abd92da59b91fce9de20e'
         'fec5f59cf1520a0a5618e37fd16884ee'
         'df3c9cc472541da979618cf7f9b1d001')

install=hpgcc.install

prepare(){

  cd $srcdir/$pkgname"_20"
  tar -xvf *tar

  patch examples/Makefile < ../../examples_Makefile.diff
  patch examples/games/Makefile < ../../examples_games_Makefile.diff
  patch examples/hump/Makefile < ../../examples_hump_Makefile.diff
  patch examples/decnumber/Chudnovsky/Makefile < ../../examples_decnumber_Chudnovsky_Makefile.diff
  patch examples/decnumber/matrix/Makefile < ../../examples_decnumber_matrix_Makefile.diff
  patch examples/decnumber/RSA/Makefile < ../../examples_decnumber_RSA_Makefile.diff
  patch examples/decnumber/sqrt2/Makefile < ../../examples_decnumber_sqrt2_Makefile.diff
  patch examples/benchmarks/Makefile < ../../examples_benchmarks_Makefile.diff

}
build() {
  cd $srcdir/$pkgname"_20"
  export PATH=$PATH:$(pwd)/bin
  cd sources/
  make
  install=hpgcc.install
}
package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/local
  cp -r $srcdir/$pkgname"_20" $pkgdir/usr/local/$pkgname
  rm $pkgdir/usr/local/$pkgname/*tar
}

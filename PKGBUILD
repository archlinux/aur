# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=gcc-dragonegg-plugin
pkgver=3.4
_gccver=4.8.2
pkgrel=1
pkgdesc="integrates the LLVM optimizers and code generator with the GCC parsers"
arch=('i686' 'x86_64')
url="http://dragonegg.llvm.org/"
license=('GPL')
depends=("gcc>=${_gccver}" "llvm>=${pkgver}")
source=(http://llvm.org/releases/${pkgver}/dragonegg-${pkgver}.src.tar.gz{,.sig})
md5sums=('5a8004d0a3b6aeb89dd1265d899b681a'
         'bc377f54c5b1d70896edce2689ba41a5')

_plugindir=/usr/lib/gcc/${CHOST}/${_gccver}/plugin

build() {
  cd $srcdir/dragonegg-${pkgver}/
  sed -i "s#\$(shell svnversion -n \$(TOP_DIR))#$pkgver#" Makefile
  make
}

package() {
  cd $srcdir/dragonegg-${pkgver}/
  install -Dm755 dragonegg.so $pkgdir/${_plugindir}/dragonegg.so
}

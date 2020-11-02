# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=exciting
pkgver=7.14
_isotope=nitrogen-14
pkgrel=1
pkgdesc="A full-potential all-electron density-functional-theory package"
arch=("x86_64")
url="http://exciting-code.org"
license=("GPL")
depends=('scalapack' 'arpack')
source=("http://exciting.wdfiles.com/local--files/$_isotope/$pkgname.$_isotope.tar.gz"
        "make.inc")
sha256sums=('a7feaffdc23881d6c0737d2f79f94d9bf073e85ea358a57196d7f7618a0a3eff'
            '30503a36da77ee97fd7c6beb4445b1215915fad41e4714368b5584866131e5fe')

prepare() {
  cd "$srcdir/$pkgname/build"
  cp "$srcdir/make.inc" .
  sed -i 's/libs::  libbzint.a fftlib.a libarpack.a libmsec.a libfox leblaiklib.a libxc.a liblbfgs.a/libs::  libbzint.a fftlib.a libmsec.a libfox leblaiklib.a libxc.a liblbfgs.a/g' Make.common
}

build() {
  cd "$srcdir/$pkgname"
  make mpi
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/bin"
  cp -r bin/* "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  chmod -R 755 docs
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname"
}

# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=etsh
pkgver=5.4.0
pkgrel=1
pkgdesc="An enhanced, backward-compatible port of the V6 UNIX <-> V6 Thompson shell."
arch=('x86_64')
url="https://etsh.nl/"
license=('GPL')
source=(https://etsh.nl/src/${pkgname}_${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha512sums=('7360da1e9bc6a7ed8c38e95eb1e2159bd2803ffa1a032235380d5901a1a6e0399d418b532917e8578bdab53fb43f99d35affc7753da0ec5612bbb8d47715970a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  mv Makefile Makefile.orig
  sed -e 's/\/usr\/local/\/usr/g' Makefile.orig > Makefile
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

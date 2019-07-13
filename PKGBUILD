# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=wcslib62
_pkgname=wcslib
pkgver=6.2
pkgrel=2
pkgdesc="A C library that implements the 'World Coordinate System' (WCS) standard in FITS"
arch=('x86_64')
url="https://www.atnf.csiro.au/people/Mark.Calabretta/WCS/"
license=('GPL3')
depends=('cfitsio')
makedepends=('gcc-fortran')
provides=("${_pkgname}=${pkgver}")
conflicts=('wcslib')
source=("ftp://ftp.atnf.csiro.au/pub/software/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('bb4dfe242959bc4e5540890e0475754ad4a027dba971903dc4d82df8d564d805')

build() {
    cd ${_pkgname}-${pkgver}

    ./configure --prefix=/usr --without-pgplot
    make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # Fix wrong permissions
  chmod g=rx,-s "${pkgdir}"/usr/{bin/,/lib/{,pkgconfig},share/man/man1/}
  chmod -s "${pkgdir}"/usr/{include/wcslib-${pkgver}/,share/doc/wcslib-${pkgver}/{,html/}}
}

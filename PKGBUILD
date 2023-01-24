# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=4.2.5
pkgrel=1
pkgdesc="Indent, beautify and relabel Fortran source, generates dependencies"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/${pkgname}"
license=('custom:BSD-3-clause')
depends=(bash)
makedepends=(gcc-fortran)
source=(https://master.dl.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('bffb5caa07ca73913592a2ab585582c19eddc1386dc51af12f72ba3df0769c9f686a319a5206ef2139fa102761d6087fe2b05f3f86565ed9375500939f8991f6')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

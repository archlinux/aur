# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=radamsa
pkgver=0.5
pkgrel=1
pkgdesc='General purpose mutation based fuzzer'
url='https://github.com/aoh/radamsa'
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('owl-lisp')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aoh/radamsa/archive/v${pkgver}.tar.gz)
sha512sums=('3fd4c9877bc16e527a78fe5fd19c9f51064a2799cc616e5528ebade667daea79f40245f54a4e841d512c18e4847c14805e617f9729fdd2a8d3689a5c3f0068f4')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -ri '/make get-owl/d' Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make \
    USR_BIN_OL=/usr/bin/ol \
    CFLAGS="${CFLAGS}" \
    OWL="/usr/bin/ovm /var/lib/owl-lisp/fasl/init.fasl"
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

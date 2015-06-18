# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=radamsa
pkgver=0.4
pkgrel=1
pkgdesc="General purpose mutation based fuzzer"
url="https://github.com/aoh/radamsa"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('owl-lisp')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aoh/radamsa/archive/v${pkgver}.tar.gz)
sha512sums=('986823886ea6954facf35b1cde58917a3ca70928c6bb1aa9693abd6b5f8e728c4c3f8268df244886b238b45839d7219df718a4a5bff49008ae0d787737f6538a')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -ri '/make get-owl/d' Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make OL=/usr/bin/ol
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

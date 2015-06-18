# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=radamsa-git
pkgver=0.4.282.d55035a
pkgrel=1
pkgdesc="General purpose mutation based fuzzer"
url="https://github.com/aoh/radamsa"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('git' 'owl-lisp')
provides=('radamsa')
conflicts=("radamsa")
source=(${pkgname}::git+https://github.com/aoh/radamsa)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed -ri '/make get-owl/d' Makefile
}

build() {
  cd ${pkgname}
  make OL=/usr/bin/ol
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

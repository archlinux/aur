# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=radamsa-git
pkgver=0.5.339.fa95381
pkgrel=1
pkgdesc='General purpose mutation based fuzzer'
url='https://github.com/aoh/radamsa'
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
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  make \
    USR_BIN_OL=/usr/bin/ol \
    OWL="/usr/bin/ovm /var/lib/owl-lisp/fasl/init.fasl" \
  build_radamsa
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

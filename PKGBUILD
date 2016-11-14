# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=owl-lisp-git
pkgver=0.1.13+16+gb0b76d1
pkgrel=1
pkgdesc='Simple purely functional lisp'
url='https://github.com/aoh/owl-lisp'
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('owl-lisp')
conflicts=('owl-lisp')
source=(${pkgname}::git+https://github.com/aoh/owl-lisp)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'|sed -r 's|v?(.+)|\1|g'
}

prepare() {
  cd ${pkgname}
  sed -ri 's|( \$\(CFLAGS\))|\1 $(LDFLAGS)|g' Makefile
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 fasl/* -t "${pkgdir}/var/lib/${pkgname}/fasl"
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:

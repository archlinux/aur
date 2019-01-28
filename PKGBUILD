# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=lander-curses-git
_pkgname=lander
pkgver=r7.5d74b68
pkgrel=1
pkgdesc="1989 curses implementation of the ancient lunar lander video game"
url="https://github.com/staceycampbell/lander"
depends=('ncurses')
makedepends=('git')
conflicts=('lander-curses')
license=('GPL')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/staceycampbell/lander.git')
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${pkgname}
  sed -i '/^HSFILE/s%.*%HSFILE := /usr/share/lander/lander.hs%' Makefile
}

build() {
  cd ${srcdir}/${pkgname}
  make
  gzip lander.6
}

package() {
  cd ${srcdir}/${pkgname}
  install -d "${pkgdir}/usr/share/lander"
  install -Dm755 lander "${pkgdir}/usr/bin/lander"
  install -Dm644 lander.6.gz "${pkgdir}/usr/share/man/man6/lander.6.gz"
  install -Dm644 README "${pkgdir}/usr/share/doc/lander/README"
  touch "${pkgdir}/usr/share/lander/lander.hs"
}

# vim:set ts=2 sw=2 et:

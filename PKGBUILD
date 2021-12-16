# Maintainer: katoitalia

pkgname=neo-matrix-git
pkgver=r20.28cddfa
pkgrel=3
pkgdesc='Simulates the digital rain from "The Matrix" (cmatrix clone with 32-bit color and Unicode support)'
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url='https://github.com/st3w/neo'
license=('GPL3')
depends=('ncurses' 'ttf-hanazono')
makedepends=('git' 'autoconf-archive')
provides=('neo-matrix')
conflicts=('neo-matrix')
source=("git+https://github.com/st3w/neo.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/neo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/neo"
  ./autogen.sh
}

build() {
  cd "${srcdir}/neo"
  ./configure
  make
}

package() {
  cd "${srcdir}/neo"
  install -Dm755 "${srcdir}/neo/src/neo" "${pkgdir}/usr/bin/neo-matrix"
}

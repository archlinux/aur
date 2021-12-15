# Maintainer: katoitalia

pkgname=neo-matrix-git
pkgver=r19.31391fd
pkgrel=2
pkgdesc='Simulates the digital rain from "The Matrix" (cmatrix clone with 32-bit color and Unicode support)'
arch=('any')
url='https://github.com/st3w/neo'
license=('GPL3')
makedepends=('git' 'autoconf-archive')
depends=('ttf-hanazono')
provides=('neo-matrix-git')
source=("git+https://github.com/st3w/neo.git")
md5sums=('SKIP')
options=(!strip)

pkgver() {
  cd "${srcdir}/neo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/neo"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/neo"
  install -Dm755 "${srcdir}/neo/src/neo" "${pkgdir}/usr/bin/neo-matrix"
}

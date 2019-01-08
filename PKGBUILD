# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=colpack-git
_pkgname=ColPack
pkgdesc="A Graph Coloring Algorithm Package"
arch=('x86_64' 'i686')
url="https://github.com/CSCsw/ColPack"
license=('LGPL3')
makedepends=('git')
provides=('colpack')
#conflicts=('colpack')
options=()
source=(git+https://github.com/CSCsw/ColPack.git)
md5sums=('SKIP')

pkgver="r109.10b780b"
pkgrel=1

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build

  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR="/usr/lib"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cd build

  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd build

  make DESTDIR="${pkgdir}" install
}

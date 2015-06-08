pkgname=hodlr
pkgver=r131.c69cf44
pkgrel=1
pkgdesc="A fast, accurate direct solver and determinant computation for dense linear systems"
license=('MPL2')
arch=('any')
url="https://github.com/sivaramambikasaran/HODLR"
depends=('eigen')
makedepends=('cmake')
source=("HODLR::git+https://github.com/sivaramambikasaran/HODLR.git")
md5sums=('SKIP')

pkgver() {
  cd HODLR 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd HODLR
  sed -i "s|\-Werror||g" CMakeLists.txt
}

build() {
  cd HODLR
  cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd HODLR
  make DESTDIR="$pkgdir" install
}

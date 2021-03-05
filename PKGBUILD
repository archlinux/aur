# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgname=clazy-git
pkgver=r2320.e77c6056
pkgrel=1
pkgdesc='Static C++ code checker'
arch=(i686 x86_64)
url='http://www.kdab.com/use-static-analysis-improve-performance/'
license=(GPL2)
depends=(clang llvm)
optdepends=('clazy-mkspec: to use clazy from qmake')
makedepends=(git cmake make gcc)
provides=(clazy)
conflicts=(clazy)
source=("git+https://invent.kde.org/sdk/clazy.git")
sha256sums=('SKIP')

pkgver() {
  cd clazy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../clazy \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

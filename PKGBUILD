# Author: Roman Gilg <subdiff@gmail.com>

pkgname=disman-kwinft
pkgver=5.27
pkgrel=1
pkgdesc='Qt/C++ display management library'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/disman"
license=(LGPL)
depends=(kcoreaddons qt5-x11extras wrapland)
provides=("disman")
conflicts=("disman")
makedepends=(extra-cmake-modules git kdoctools qt5-tools)
source=("git+https://gitlab.com/kwinft/disman.git")
sha256sums=('SKIP')

prepare() {
  cd disman
  git checkout Plasma/$pkgver
}
  
build() {
  mkdir -p build
  cd build
  cmake ../disman \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

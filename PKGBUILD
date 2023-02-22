# Author: Roman Gilg <subdiff@gmail.com>

pkgname=wrapland-kwinft
pkgver=5.27
pkgrel=1
pkgdesc='Qt/C++ library wrapping libwayland'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/wrapland"
license=(LGPL)
depends=('kwayland')
provides=("wrapland")
conflicts=("wrapland")
makedepends=(doxygen extra-cmake-modules git qt5-doc qt5-tools wayland-protocols)
source=("git+https://gitlab.com/kwinft/wrapland.git")
sha256sums=('SKIP')

prepare() {
  cd wrapland
  git checkout Plasma/$pkgver
}

build() {
  mkdir -p build
  cd build
  cmake ../wrapland \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

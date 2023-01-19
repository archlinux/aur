# Author: Roman Gilg <subdiff@gmail.com>

pkgname=wrapland-kwinft
pkgver=5.26.5.r1816.g0f130e9
_ver=5.26.5
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
md5sums=('SKIP')

pkgver() {
  _ver=5.26.5
  cd wrapland
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}


prepare() {
  mkdir -p build
}

build() {
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

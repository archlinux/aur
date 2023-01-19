# Author: Roman Gilg <subdiff@gmail.com>

pkgname=kdisplay-kwinft
pkgver=5.26.5.r1520.g2c74b7e
pkgrel=1
pkgdesc='App and daemon for display managing'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
depends=(disman kcmutils kirigami2 plasma-framework qt5-sensors)
provides=(kscreen)
conflicts=(kscreen)
makedepends=(extra-cmake-modules git kdoctools qt5-tools)
source=("git+https://gitlab.com/kwinft/kdisplay.git")
sha256sums=('SKIP')

pkgver() {
  _ver=5.26.5
  cd kdisplay
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdisplay \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

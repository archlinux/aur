# Author: Roman Gilg <subdiff@gmail.com>

pkgname=kdisplay-kwinft
pkgver=5.27
pkgrel=2
pkgdesc='App and daemon for display managing'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
depends=(disman kcmutils5 kirigami2 plasma-framework5 qt6-sensors)
provides=(kscreen)
conflicts=(kscreen)
makedepends=(extra-cmake-modules git kdoctools5 qt6-tools)
source=("git+https://gitlab.com/kwinft/kdisplay.git")
sha256sums=('SKIP')

prepare() {
  cd kdisplay
  git checkout Plasma/$pkgver
}

build() {
  mkdir -p build
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

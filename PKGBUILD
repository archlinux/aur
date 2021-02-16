# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libqhy
pkgver=1.8.8
pkgrel=1
pkgdesc="libqhy used by INDI QHY drivers. Please note that for sake of simplicity package version follows libindi versionning."
url="http://www.indilib.org/index.php?title=Main_Page"
license=(MIT)
arch=(i686 x86_64)
depends=()
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=('0a50aff683e4e76d12b7558076734ace3c4340d93fcab2c25c8a7c0bc3d53816')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    ../indi-3rdparty-${pkgver}/libqhy
  make
}


package() {
  cd build
  make DESTDIR="$pkgdir" install
}

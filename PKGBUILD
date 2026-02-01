# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-aagcloudwatcher-ng
pkgver=2.1.8
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-aagcloudwatcher-ng"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} gcc-libs )
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("3f9a42e6f07aa7cce4271c1842fef9bf62a2b1bcd1d1a0a6e7476b00be386da8")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/indi-aagcloudwatcher-ng/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

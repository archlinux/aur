# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-pentax
pkgver=2.1.5.1
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-pentax"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libraw libpktriggercord libricohcamerasdk )
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("9a85e6cf928dd095f019adf1919c79f9a3ac55294bedb8c9f65cc8bf3f9152d8")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/indi-pentax/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

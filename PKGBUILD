# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libahp-xc
pkgver=2.1.2.1
pkgrel=1
pkgdesc="INDI driver for products manufactured by ahp-xc"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libusb-compat libftdi-compat )
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("d29a667a5b9bf3b1d9be5f2ca81bfff5573e98a6941f764fd687d439e1b8abb6")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/libahp-xc/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

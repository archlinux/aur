# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libtscam
pkgver=2.2.5
pkgrel=1
pkgdesc="INDI driver for products manufactured by tscam"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(glibc)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("c4db74b0b8c87a906cf7f90393118002e7fcce419cd967943034eca22bbbb059")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/libtscam/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

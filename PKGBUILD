# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-armadillo-platypus
pkgver=2.1.4
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-armadillo-platypus"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(gcc-libs libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz" "fix_cmake.patch")
sha256sums=("e9ab43d08d09555d2c9d3c658d1bcc3130c3465a3afe2300995fba0d6e737080" "715017dd2cae5a53ac12648e15cad6ada0688e391b6fc3bcaf3e788a7e801134")

prepare() {
  mkdir -p build
  cd indi-3rdparty-${pkgver}
  patch -Np1 < ${srcdir}/fix_cmake.patch
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/indi-armadillo-platypus/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

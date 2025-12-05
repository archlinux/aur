# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-shelyak
pkgver=2.1.7
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-shelyak"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(glibc libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("4d1e3ee713af1bac2e86627d5fed3c542187f2246168f195b3ec802607c71e8b")

prepare() {
  mkdir -p build
}

build() {
  cd build
  export CFLAGS+=" -std=c++23"
  export CXXFLAGS="${CFLAGS}"
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/indi-shelyak/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-starbook-ten
pkgver=2.2.2
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-starbook-ten"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(glibc libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("ea4e90f3549cb28860d0d2a5820734579d4aa5b8c04ba202bc413ce5ffdb0377")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/indi-starbook-ten/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

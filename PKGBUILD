# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-tscam
pkgver=2.2.2
pkgrel=1
pkgdesc="INDI driver for Touptek products branded as Telesco Service"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libtscam=${pkgver})
makedepends=(cmake libtscam=${pkgver})
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
    -DWITH_TOUPCAM=Off \
    -DWITH_ALTAIRCAM=Off \
    -DWITH_BRESSERCAM=Off \
    -DWITH_MALLINCAM=Off \
    -DWITH_MEADECAM=Off \
    -DWITH_NNCAM=Off \
    -DWITH_OGMACAM=Off \
    -DWITH_OMEGONPROCAM=Off \
    -DWITH_STARSHOOTG=Off \
    -DWITH_TSCAM=On \
    -DWITH_SVBONYCAM=Off \
    ../indi-3rdparty-${pkgver}/indi-toupbase
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-altaircam
pkgver=2.2.5
pkgrel=1
pkgdesc="INDI driver for Touptek products branded as Altair"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libaltaircam=${pkgver})
makedepends=(cmake libaltaircam=${pkgver})
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
    -DWITH_TOUPCAM=Off \
    -DWITH_ALTAIRCAM=On \
    -DWITH_BRESSERCAM=Off \
    -DWITH_MALLINCAM=Off \
    -DWITH_MEADECAM=Off \
    -DWITH_NNCAM=Off \
    -DWITH_OGMACAM=Off \
    -DWITH_OMEGONPROCAM=Off \
    -DWITH_STARSHOOTG=Off \
    -DWITH_TSCAM=Off \
    -DWITH_SVBONYCAM=Off \
    ../indi-3rdparty-${pkgver}/indi-toupbase
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

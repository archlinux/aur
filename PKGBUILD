# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-svbonycam
pkgver=2.1.7
pkgrel=1
pkgdesc="INDI driver for Touptek products branded as SVBony"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libsvbonycam=${pkgver})
makedepends=(cmake libsvbonycam=${pkgver})
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("4d1e3ee713af1bac2e86627d5fed3c542187f2246168f195b3ec802607c71e8b")

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
    -DWITH_TSCAM=Off \
    -DWITH_SVBONYCAM=On \
    ../indi-3rdparty-${pkgver}/indi-toupbase
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

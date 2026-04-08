# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-ogmacam
pkgver=2.2.0
pkgrel=1
pkgdesc="INDI driver for Touptek products branded as Ogma"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libogmacam=${pkgver})
makedepends=(cmake libogmacam=${pkgver})
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("2f5f329326bf6e468e6313724679e2934314dcee234715cbc5cac39279142f04")

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
    -DWITH_OGMACAM=On \
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

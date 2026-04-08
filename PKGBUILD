# Maintainer: Lehel Gyuro <lehel@freemail.hu>
# Contributor: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-gpsd
pkgver=2.2.0
pkgrel=1
pkgdesc="3rd party drivers for INDI: GPSD"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL2)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} gpsd)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz" )
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
    ../indi-3rdparty-${pkgver}/indi-gpsd/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

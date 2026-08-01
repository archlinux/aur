# Maintainer: Lehel Gyuro <lehel@freemail.hu>
# Contributor: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-gpsnmea
pkgver=2.2.4
pkgrel=1
pkgdesc="3rd party drivers for INDI: GPS NMEA"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL3)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libplayerone=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("bb1efc5a6a7a00ce34dd5f3817c877d5537050550be8f8654aaa3d3ec08cc5ef")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/indi-gpsnmea/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

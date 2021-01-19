# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-gpsnmea
pkgver=1.8.8
pkgrel=1
pkgdesc="3rd party drivers for INDI: GPS NMEA"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL3)
arch=(i686 x86_64)
depends=(libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=('0a50aff683e4e76d12b7558076734ace3c4340d93fcab2c25c8a7c0bc3d53816')

prepare() {
  mkdir -p build
  cd  indi-3rdparty-${pkgver}

  #set all to off by default
  sed -i -e '/option(WITH_.*On/s/ On/ Off/' CMakeLists.txt
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_GPSNMEA=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

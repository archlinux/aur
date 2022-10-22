# Maintainer: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-gpsd
pkgver=1.9.8
pkgrel=1
pkgdesc="3rd party drivers for INDI: GPSD"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL2)
arch=(i686 x86_64)
depends=(libindi=${pkgver} gpsd)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz" )
sha256sums=("a222a22ca4edae1816255e3851cfdb91efff557378021a44ca05d672410fc81e")

prepare() {
  mkdir -p build
  cd  indi-3rdparty-${pkgver}

  #set all to off by default
  sed -i -e '/option(WITH_.*On)$/s/ On)$/ Off)/' CMakeLists.txt
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_GPSD=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

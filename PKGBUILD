# Maintainer: Will Gauvin <wgauvin@gmail.com>

pkgname=libindi-astromechfoc
pkgver=1.9.9
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for Astromechanics Focuser T-Ring"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=('93e3fb958516f2541ceb6ef3daa17def9f68dab1e9768d0be58526307781ca74')

prepare() {
  mkdir -p build
  cd  indi-3rdparty-${pkgver}

  #set all to off by default
  sed -i -e '/option(WITH_.*On/s/ On)/ Off)/' CMakeLists.txt
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_ASTROMECHFOC=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

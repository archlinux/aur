# Maintainer: Will Gauvin <wgauvin@gmail.com>

pkgname=libindi-astromechfoc
pkgver=2.0.1
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for Astromechanics Focuser T-Ring"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=('be98a84ab6166321fe5aa74fca132cd866ae4e6910ef3b97e3502a44c59d277d')

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

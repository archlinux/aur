pkgname=simgear
pkgver=2024.1.1
_pkgver=v2024.1.1
pkgrel=2
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="http://home.flightgear.org/"
license=('LGPL-2.0-only')
depends=('openscenegraph' 'openal' 'ffmpeg')
makedepends=('plib' 'boost174' 'cmake' 'mesa')
source=("https://gitlab.com/flightgear/simgear/-/archive/${_pkgver}/simgear-${_pkgver}.tar.gz")
sha256sums=('5e7215d5876d1def78b90a1dee5424f0b3f4ecd7a71a1e074e21d984d4d2dbbf')

build() {
  mv $srcdir/simgear-${_pkgver} $srcdir/simgear
  mkdir -p $srcdir/sgbuild
  cd $srcdir/sgbuild
  cmake $srcdir/simgear \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSIMGEAR_SHARED=ON \
    -DENABLE_TESTS=OFF \
    -DBoost_DIR="/opt/boost-1.74.0/lib/cmake/Boost-1.74.0"
  make
}

package() {
  cd "$srcdir"/sgbuild
  make DESTDIR=${pkgdir} install
}

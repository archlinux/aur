pkgname=simgear
pkgver=2024.1.1
_pkgver=2024.1.1
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="http://home.flightgear.org/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost174' 'cmake' 'mesa')
source=("https://gitlab.com/flightgear/simgear/-/archive/v${_pkgver}/simgear-v${_pkgver}.tar.gz")
sha256sums=('5e7215d5876d1def78b90a1dee5424f0b3f4ecd7a71a1e074e21d984d4d2dbbf')

build() {
  mv $srcdir/simgear-v${_pkgver} $srcdir/simgear
  mkdir -p "$srcdir"/sgbuild
  cd "$srcdir"/sgbuild
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSIMGEAR_SHARED=ON \
    -DENABLE_TESTS=OFF \
    ../simgear
  make
}

package() {
  cd "$srcdir"/sgbuild
  make DESTDIR=${pkgdir} install
}

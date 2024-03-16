# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=openems-git
pkgver=v0.0.36.r15.g1ccf094
pkgrel=1
pkgdesc="a free and open source EC-FDTD solver"
url="https://github.com/thliebig/openEMS"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('cmake' 'qt5-base' 'tinyxml' 'hdf5' 'boost' 'vtk' 'unixodbc' 'cgal' 'openmpi' 'csxcad' 'verdict' 'fmt')
provides=('openems')
conflicts=('openems')

source=(git+https://github.com/thliebig/openEMS)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/openEMS"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd openEMS
}

build() {
  cd "$srcdir/openEMS"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DCSXCAD_ROOT_DIR=/usr ../
  make
}

package() {
  cd "$srcdir/openEMS/build"
  make install
}

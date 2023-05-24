# Maintainer: syntheit <daniel@matv.io>
# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>

pkgname=ogre-pagedgeometry-git
pkgver=1.2.0.r64.g30965c8
pkgrel=1
pkgdesc="Paged Geometry plugin for OGRE for fast rendering of trees and grass."
arch=('i686' 'x86_64')
url="https://ogrecave.github.io/ogre-pagedgeometry/"
license=('custom')
depends=('ogre')
makedepends=('cmake' 'git')
provides=('ogre-pagedgeometry')
source=(git+https://github.com/OGRECave/ogre-pagedgeometry.git)
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/ogre-pagedgeometry
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/ogre-pagedgeometry

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DPAGEDGEOMETRY_BUILD_SAMPLES=0 \
    -DCMAKE_INSTALL_PREFIX=/usr 
  make
}


package() {
  cd $srcdir/ogre-pagedgeometry/build
  make DESTDIR="$pkgdir/" install
}

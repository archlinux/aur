pkgname=ogre-1.9-pagedgeometry
pkgver=1.1.3
pkgrel=1
pkgdesc="Paged Geometry plugin for OGRE for fast rendering of trees and grass."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ogre-paged"
license=('MIT')
makedepends=('ogre-1.9' 'boost' 'cmake' 'git')
provides=('ogre-pagedgeometry')
source=(git+https://github.com/RigsOfRods/ogre-pagedgeometry)
sha512sums=('SKIP')

build() {
  cd $srcdir/ogre-pagedgeometry
  export PKG_CONFIG_PATH="/opt/OGRE-1.9/lib/pkgconfig"

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DPAGEDGEOMETRY_BUILD_SAMPLES=0 \
    -DCMAKE_INSTALL_PREFIX=/opt/PagedGeometry-OGRE1.9
  make  
}


package() {
  cd /$srcdir/ogre-pagedgeometry/build
  make DESTDIR="$pkgdir/" install 
}

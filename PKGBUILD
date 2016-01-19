pkgname=ogre-pagedgeometry-git
pkgver=1.1.3
pkgrel=4
pkgdesc="Paged Geometry plugin for OGRE for fast rendering of trees and grass."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ogre-paged"
license=('MIT')
makedepends=('ogre' 'boost' 'cmake' 'git')
provides=('ogre-pagedgeometry')
source=(git+https://github.com/RigsOfRods/ogre-pagedgeometry)
sha512sums=('SKIP')

build() {
  cd $srcdir/ogre-pagedgeometry

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build

  cmake .. \
    -DPAGEDGEOMETRY_BUILD_SAMPLES=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_DOC_PREFIX=/usr/doc/ogre-pagedgeometry
  make  
}


package() {
  cd /$srcdir/ogre-pagedgeometry/build
  make DESTDIR="$pkgdir/" install 
  mkdir $pkgdir/usr/doc/ogre-pagedgeometry
  mv  $pkgdir/usr/doc/*.txt $pkgdir/usr/doc/ogre-pagedgeometry
}

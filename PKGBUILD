# Maintainer: syntheit <daniel@matv.io>

pkgname=ogre-pagedgeometry-git
pkgver=1.2.0
pkgrel=5
pkgdesc="Paged Geometry plugin for OGRE for fast rendering of trees and grass."
arch=('i686' 'x86_64')
url="https://github.com/RigsOfRods/ogre-pagedgeometry"
license=('custom')
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
    -DCMAKE_INSTALL_PREFIX=/usr 
  make  
}


package() {
  cd /$srcdir/ogre-pagedgeometry/build
  make DESTDIR="$pkgdir/" install 
  mkdir $pkgdir/usr/doc/ogre-pagedgeometry
  mv  $pkgdir/usr/doc/*.txt $pkgdir/usr/doc/ogre-pagedgeometry
}

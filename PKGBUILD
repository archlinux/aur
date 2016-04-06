# Maintainer: Hannes Graeuler < hgraeule [at] uos [dot] de >
pkgname=sfcgal
pkgver=1.3.0
pkgrel=1
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=(i686 x86_64)
url="http://oslandia.github.io/SFCGAL/index.html"
license=('GPL')
groups=()
provides=('sfcgal')
depends=('cgal>=4.1' 'boost' 'gmp' 'mpfr' 'openscenegraph')
makedepends=('cmake')
source=("https://github.com/Oslandia/SFCGAL/archive/v$pkgver.tar.gz")
sha256sums=('7ed35439fc197e73790f4c3d1c1750acdc3044968769239b2185a7a845845df3')

build() {
  cd $srcdir/SFCGAL-$pkgver
  cmake -Wno-dev \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DSFCGAL_BUILD_VIEWER=1 \
        -DSFCGAL_BUILD_EXAMPLES=1 \
        -DSFCGAL_BUILD_TEST=1 .
  make
}
package() {
  cd $srcdir/SFCGAL-$pkgver
  make DESTDIR=$pkgdir install
  rm -rf $pkgdir/usr/include/CGAL
}

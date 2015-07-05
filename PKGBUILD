# Maintainer: Hannes Graeuler < hgraeule [at] uos [dot] de >
pkgname=sfcgal
pkgver=1.0.5
pkgrel=2
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=(i686 x86_64)
url="http://oslandia.github.io/SFCGAL/index.html"
license=('GPL')
groups=
provides=
depends=('cgal>=4.1' 'boost' 'gmp' 'mpfr' 'openscenegraph')
makedepends=('cmake')
source=("https://github.com/Oslandia/SFCGAL/archive/v$pkgver.tar.gz")
sha1sums=('816de09566d37b1dd5c6813be56c2c02a9765244')

build() {
  cd $srcdir/SFCGAL-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
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

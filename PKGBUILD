# Maintainer: Hannes Graeuler < hgraeule [at] uos [dot] de >
pkgname=sfcgal
pkgver=1.2.0
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
sha256sums=('aeab3ddd7b4eff2b9b6b365ca1731de693d7a788914d4190f444ef59dead5a47')

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

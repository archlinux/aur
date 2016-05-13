# Maintainer: Samuel Fernando Mesa Giraldo < samuelmesa [at] linuxmail [dot] org >
# Initial Maintainer: Hannes Graeuler < hgraeule [at] uos [dot] de >

pkgname=sfcgal-git
_pkgname=sfcgal
pkgver=0
pkgrel=1
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=(i686 x86_64)
url="http://oslandia.github.io/SFCGAL/index.html"
license=('GPL')
groups=()
depends=('cgal>=4.1' 'boost' 'gmp' 'mpfr' 'openscenegraph')
makedepends=('cmake')
provides=('sfcgal')
conflicts=('sfcgal')
source=('sfcgal'::'git://github.com/Oslandia/sfcgal.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -Wno-dev \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DSFCGAL_BUILD_VIEWER=1 \
        -DSFCGAL_BUILD_EXAMPLES=1 \
        -DSFCGAL_BUILD_TEST=1 .
  make -j2
}
package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR=$pkgdir install
  rm -rf $pkgdir/usr/include/CGAL
}

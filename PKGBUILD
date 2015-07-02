# Maintainer: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=2.0.0
pkgrel=8
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=1.5' 'gcc-libs' 'cgal')
makedepends=('cmake>=2.8.8' 'boost')
source=("$pkgname-$pkgver"::git://github.com/pgRouting/pgrouting.git)
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf build
  mkdir build
  cd build

  cmake ../ \
	-DWITH_DD=ON \
    -DWITH_TSP=ON

  make
}

package() {
        cd "$srcdir/$pkgname-$pkgver/build"
        make DESTDIR="$pkgdir/" install
}

# Contributor: Andre Klitzing <andre () incubo () de>
#              Sebastian Jeworutzki <sebastian.jeworutzki () rub () de>

pkgname=pgrouting-1.x
pkgver=1.05
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.postlbs.org"
license=('GPL')
depends=('postgis' 'gcc-libs')
makedepends=('cmake>=2.3' 'boost>=1.47')
source=(${pkgname}-git::git+https://github.com/albfan/pgrouting#branch=1.05-archlinux)

sha1sums=('SKIP')
          
build() {
  cd ${pkgname}-git
  mkdir build
  cd build 
  # TSP needs package GAUL and DD needs CGAL
  #cmake .. -DWITH_TSP=ON -DWITH_DD=ON
  cmake ..
  make 
}

package() {
  cd "$srcdir/${pkgname}-git/build"
  make DESTDIR="$pkgdir/" install
}

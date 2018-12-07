# Maintainer: Brad Ackerman <brad at facefault dot org>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=2.6.2
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=2.0' 'gcc-libs' 'cgal')
makedepends=('cmake' 'boost' 'postgresql>=9.2')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pgRouting/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('6e37f66e631d0cc87e135be7d095822aae21656bb56b3d18afa5bececaad8cee6324d37e8e152bbf69e3374ded1f10aa4b9a4c52b873e3a4c43e73cd877fddcb')
prepare() {
   cd $pkgname-$pkgver

  [[ -d build ]] || mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake -L ../

  make
}

package() {
        cd $pkgname-$pkgver
        make -C build DESTDIR="$pkgdir/" install
}

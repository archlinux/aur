# Maintainer: Brad Ackerman <brad at facefault dot org>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=2.6.3
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=2.0' 'gcc-libs' 'cgal')
makedepends=('cmake' 'boost' 'postgresql>=9.2')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pgRouting/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('fc121a126c1c65bf9b6b9d720a6918114565506d8399c4235975b4b9e800ff744296226eb6707867a9c010c0dc24ec6a929dc39e6b277bd56b8e6d9f0216036c')
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

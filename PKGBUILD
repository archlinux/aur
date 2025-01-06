# Maintainer: Brad Ackerman <brad at facefault dot org>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=3.7.1
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=2.0' 'gcc-libs' 'cgal')
makedepends=('cmake' 'boost' 'postgresql>=13')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pgRouting/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('0bd73330a92625f82778742dbbb35e150e9a2b21223ec95025b510951dca6910ea9f936ec9561c9467cab8ce55a256ad1fb2df1617fee7cfce4d5836a4212915')
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

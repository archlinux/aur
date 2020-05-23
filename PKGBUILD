# Maintainer: Brad Ackerman <brad at facefault dot org>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=3.0.0
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=2.0' 'gcc-libs' 'cgal')
makedepends=('cmake' 'boost' 'postgresql>=9.2')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pgRouting/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('6e8700d315df14d0a87e5520c5b9e683dc1c88859614a1396b9844c56032b35b930882756a0069354cbc4542f6108362bed7beb027a1362803237e0682fc4885')
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

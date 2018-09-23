# Maintainer: Brad Ackerman <brad at facefault dot org>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=2.6.1
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=2.0' 'gcc-libs' 'cgal')
makedepends=('cmake' 'boost' 'postgresql>=9.2')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pgRouting/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=("c42553fb464955d56041a1c800de74bb7ac577da11f81d58380e4e9139acfe59ea3cf8e93a59a1e8bc399844463bb50bdc9300c195fe36e1864ea508a8ba0165")
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

# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.5.0
pkgrel=1
pkgdesc="tool for loading OpenStreetMap data into a PostgreSQL / PostGIS database"
arch=('x86_64')
url="https://osm2pgsql.org/"
license=('GPL')
depends=('boost-libs' 'expat' 'geos' 'proj' 'postgresql-libs' 'zlib')
makedepends=('boost' 'cmake' 'lua')
optdepends=('lua: used for Lua tag transforms'
	'postgresql: for creating a PostgreSQL database'
	'postgis: for creating a PostGIS database')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstreetmap/osm2pgsql/archive/$pkgver.tar.gz")
sha256sums=('d31be268dda21cf31418f68c78b8e0cbbd90cd8a283c4dfe0c134a7960936fce')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}

# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.8.1
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
source=("https://github.com/openstreetmap/osm2pgsql/archive/$pkgver.tar.gz")
sha256sums=('9e3cd9e13893fd7a153c7b42089bd23338867190c91b157cbdb4ff7176ecba62')

prepare() {
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir/" cmake --install build
}

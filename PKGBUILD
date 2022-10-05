# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.7.1
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
source=("https://github.com/openstreetmap/osm2pgsql/archive/$pkgver.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/openstreetmap/osm2pgsql/pull/1793.patch")
sha256sums=('76c303bfb28440eee546d0f7327565a08d6dac20a915f95dbb4bf21f2e691141'
            '7d4be95dc287065fd8febcfdb93df2dc6a871990c27ddfa0953e8c7d392c3c75')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir"/1793.patch
}

build() {
    cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir/" cmake --install build
}

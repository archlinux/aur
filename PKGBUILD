# Maintainer: Raphael Dümig <duemig@in.tum.de>

pkgname=osm2pgsql-git
pkgver=0.88.0.r142.geece9ac
pkgrel=1
pkgdesc="tool for loading OpenStreetMap data into a PostgreSQL / PostGIS database"
arch=('i686' 'x86_64')
url="https://github.com/openstreetmap/osm2pgsql"
license=('GPL')
depends=('expat' 'geos' 'proj' 'postgresql-libs' 'boost-libs')
makedepends=('boost')
optdepends=('lua: used for Lua tag transforms'
	'postgresql: for creating a PostgreSQL database'
	'postgis: for creating a PostGIS database')
source=("$pkgname::git://github.com/openstreetmap/osm2pgsql.git")
md5sums=('SKIP')

pkgver() {
        cd "$pkgname"
        git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$srcdir/$pkgname"
        ./autogen.sh
        ./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname"
        make DESTDIR="$pkgdir/" install
	install install-postgis-osm-{db,user}.sh "$pkgdir/usr/bin"
}

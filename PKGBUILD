# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname=firebird-odbc
pkgver=2.0.2
_pkgsubver=153
pkgrel=1
pkgdesc="An ODBC Driver for Firebird RDBMS"
arch=(i686 x86_64)
url="http://www.firebirdsql.org/en/odbc-driver/"
license=('custom')
depends=(unixodbc libfbclient)
sha512sums=(956ccf724a56b8c49b6405f6868f6d93349fd7a5abac10a34003adbb6bb15148e608d10eb3c9f8288da8859079ad920277b419f1cfccf8bec797de84c567b5c0
	39e8f78c1cbe52d45b730ea40d2cb02320c00aa6a94682e78cbcd779ce50a2aa0538278647bd7d922646d78a7a529dfe31358e7d4f790533b9b745c8cae01df3)
source=(${pkgver}.${_pkgsubver}.tar.gz::http://sourceforge.net/projects/firebird/files/firebird-ODBC-driver/${pkgver}-Release/OdbcFb-Source-${pkgver}.${_pkgsubver}.gz/download
	license.html::http://www.firebirdsql.org/en/initial-developer-s-public-license-version-1-0/)

build() {
	cd "$srcdir"
	tar -xzof ${pkgver}.${_pkgsubver}.tar.gz
	cd "$srcdir"/Builds/Gcc.lin
	make FBLIBDIR=/usr/lib -f makefile.linux
}

package() {
	cd "$srcdir"
	install -Dm644 license.html $pkgdir/usr/share/licenses/${pkgname}/license.html
	cd "$srcdir"/Builds/Gcc.lin/Release_x86_64
	install -Dm755 libOdbcFb.so $pkgdir/usr/lib/libOdbcFb.so
	install -m755 lib* $pkgdir/usr/lib
}

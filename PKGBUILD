# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname=firebird-odbc
pkgver=2.0.5
_pkgsubver=156
pkgrel=1
pkgdesc="An ODBC Driver for the Firebird RDBMS"
arch=(i686 x86_64)
url="http://www.firebirdsql.org/en/odbc-driver/"
license=('custom')
depends=(unixodbc libfbclient)
sha512sums=(ccbeee20abef51d54bbd89c65fa68229d95b87f77d21fc161e8dad4ab27d0c5bbb4a03c383fa542c6e4da48fb11f0cf233dac0dd3bb21bd518e88722a6637764
	d6b4342aee00315ea94357687ac6fa3c4230fbfd9d0e73b010603b971cafa5974fd6cb24d36a8e1d2ffff0159ce4afe17a0ac6e079cf2823989de51cad198339
	e375d0998d2edac4a8041294001793420c4797ed348d1a88a55097d775d8f016782614c7b045e3dd2ecef4f604bbf8e152db0894d13c6be4cb36dccb63834694)
source=(${pkgver}.${_pkgsubver}.tar.gz::http://sourceforge.net/projects/firebird/files/firebird-ODBC-driver/${pkgver}-Release/OdbcJdbc-src-${pkgver}.${_pkgsubver}.tar.gz/download
	license.html::http://www.firebirdsql.org/en/initial-developer-s-public-license-version-1-0/
	string-macro.patch)
prepare() {
	cd "$srcdir"
	patch -p1 < string-macro.patch
}
build() {
	cd "$srcdir/OdbcJdbc/Builds/Gcc.lin"
	make FBLIBDIR=/usr/lib -f makefile.linux
}
package() {
	cd "$srcdir"
	install -Dm644 license.html $pkgdir/usr/share/licenses/${pkgname}/license.html
	cd "$srcdir/OdbcJdbc/Builds/Gcc.lin/Release_$CARCH"
	install -Dm755 libOdbcFb.so $pkgdir/usr/lib/libOdbcFb.so
	install -m755 lib* $pkgdir/usr/lib
}

# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname=firebird-odbc
pkgver=2.0.4
_pkgsubver=155
pkgrel=1
pkgdesc="An ODBC Driver for the Firebird RDBMS"
arch=(i686 x86_64)
url="http://www.firebirdsql.org/en/odbc-driver/"
license=('custom')
depends=(unixodbc libfbclient)
sha512sums=(43a2b7450e985c2d6d0cb4f658a4652956f2da0f9c8d235b7e6f7e86cf3d3d5720a77697fa98ad0628bf1cc77907916bb5d2718179ba342526a210239e7d4068
	f2390c05a301759883506956346ce3f79ce3acd46e6f9f45a6e271e9598833fed997aae2899b088ad921cf048226d98efcab8984afd46af1d80c1bc3915081f3
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

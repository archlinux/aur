# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=13.0.0.0
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 13 for SQL Server®"
arch=('x86_64')
url="https://www.microsoft.com/en-us/download/details.aspx?id=36437"
license=('custom')
depends=('unixodbc' 'krb5')
source=("https://download.microsoft.com/download/B/C/D/BCDD264C-7517-4B7D-8159-C99FC5535680/$pkgname-$pkgver.tar.gz"
        driver.ini)
sha256sums=('2fec18bfd036460d45ff7a1e0d0b10cdd425b19fa610f472570c379ec4de4f4f'
            '1420c1fbc2437a803bd76f87591879ef77dc48784c28db64ab89d97e4bdfc0dd')
install=msodbcsql.install

package() {
	cd "$srcdir"/$pkgname-$pkgver
	install -Dm0755 lib64/libmsodbcsql-13.0.so.0.0 "$pkgdir"/usr/lib/libmsodbcsql-13.0.so.0.0
	install -Dm0755 lib64/msodbcsqlr13.rll "$pkgdir"/opt/microsoft/$pkgname/$pkgver/en_US/msodbcsqlr13.rll

	install -Dm0644 include/msodbcsql.h "$pkgdir"/usr/include/msodbcsql.h
	ln -s libcrypto.so "$pkgdir"/usr/lib/libcrypto.so.10
	ln -s libssl.so "$pkgdir"/usr/lib/libssl.so.10

	install -Dm0755 bin/bcp-$pkgver "$pkgdir"/usr/bin/bcp
	install -Dm0644 bin/bcp.rll "$pkgdir"/opt/microsoft/$pkgname/$pkgver/en_US/bcp.rll

	install -Dm0755 bin/sqlcmd-$pkgver "$pkgdir"/usr/bin/sqlcmd
	install -Dm0644 bin/SQLCMD.rll "$pkgdir"/opt/microsoft/$pkgname/$pkgver/en_US/SQLCMD.rll
	install -Dm0644 bin/BatchParserGrammar.llr "$pkgdir"/opt/microsoft/$pkgname/$pkgver/en_US/BatchParserGrammar.llr
	install -Dm0644 bin/BatchParserGrammar.dfa "$pkgdir"/opt/microsoft/$pkgname/$pkgver/en_US/BatchParserGrammar.dfa

	install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	install -Dm0644 "$srcdir"/driver.ini "$pkgdir"/opt/microsoft/$pkgname/$pkgver/template.ini
}

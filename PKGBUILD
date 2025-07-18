# Maintainer: Devin Christensen <quixoten@gmail.com>

pkgname=msodbcsql13
pkgver=13.1.9.2
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 13 for SQL Server®"
arch=('x86_64')
url="https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
provides=("msodbcsql=${pkgver}")
options=('!strip')
source=(https://packages.microsoft.com/rhel/7/prod/Packages/m/msodbcsql-$pkgver-1.x86_64.rpm)
sha256sums=('cff336d21b6ca4e48f0e297fbf64dc9cfb3d18e26d52950853062e5fda052068')
install=install.sh

package() {
	install -Dm0644 usr/share/doc/msodbcsql/RELEASE_NOTES "$pkgdir"/usr/share/doc/$pkgname/RELEASE_NOTES
	install -Dm0644 usr/share/doc/msodbcsql/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	install -d opt/microsoft/msodbcsql "$pkgdir"/opt/microsoft/$pkgname
	cp -r opt/microsoft/msodbcsql/* "$pkgdir"/opt/microsoft/$pkgname/
	sed "s:/msodbcsql/:/msodbcsql${pkgver%%.*}/:g" -i $pkgdir/opt/microsoft/$pkgname/etc/odbcinst.ini
}

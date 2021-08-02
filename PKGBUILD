# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=17.8.1.1
pkgrel=1
_opensslver=1.0.2k-19
pkgdesc="Microsoft® ODBC Driver 17 for SQL Server®"
arch=('x86_64')
url="https://blogs.msdn.microsoft.com/sqlnativeclient/"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
options=('!strip')
source=(https://packages.microsoft.com/rhel/8/prod/msodbcsql17-$pkgver-1.x86_64.rpm)
sha256sums=('b9c22b1b4ad33616909307ad2490b3ae5ee819c2710c4d8a30fd86aa259e165e')
install=msodbcsql.install

package() {
  install -Dm0644 usr/share/doc/msodbcsql17/RELEASE_NOTES "$pkgdir"/usr/share/doc/$pkgname/RELEASE_NOTES
  install -Dm0644 usr/share/doc/msodbcsql17/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  mv opt "$pkgdir"

  mv "$pkgdir"/opt/microsoft/msodbcsql{17,}

  cd "$pkgdir"/opt/microsoft/msodbcsql
  sed 's/msodbcsql17/msodbcsql/g' -i etc/odbcinst.ini
}

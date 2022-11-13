# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=18.1.2.1
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 18 for SQL Server®"
arch=('x86_64')
url="https://blogs.msdn.microsoft.com/sqlnativeclient/"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
options=('!strip')
source=(https://packages.microsoft.com/rhel/8/prod/Packages/m/msodbcsql18-$pkgver-1.x86_64.rpm)
sha256sums=('6b873170f9e27babd5d9698ad2f00546101793b8ef747cba52a2d3080b18dde6')
install=msodbcsql.install

package() {
  install -Dm0644 usr/share/doc/msodbcsql18/RELEASE_NOTES "$pkgdir"/usr/share/doc/$pkgname/RELEASE_NOTES
  install -Dm0644 usr/share/doc/msodbcsql18/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  mv opt "$pkgdir"

  mv "$pkgdir"/opt/microsoft/msodbcsql{18,}
  ln -s msodbcsql "$pkgdir"/opt/microsoft/msodbcsql18

  cd "$pkgdir"/opt/microsoft/msodbcsql
  sed 's/msodbcsql18/msodbcsql/g' -i etc/odbcinst.ini
}

# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Vitor Rodrigues <vitor.rodrigues@gmail.com>

pkgname=msodbcsql
pkgver=18.3.1.1
pkgrel=2
pkgdesc="Microsoft® ODBC Driver 18 for SQL Server®"
arch=('x86_64')
url="https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
options=('!strip')
source=(https://packages.microsoft.com/rhel/8/prod/msodbcsql18-$pkgver-1.x86_64.rpm)
sha256sums=('6c34db19a48a6873395cdef80a3acb69edf2d4b1dba421ddf10101ce709b22a0')
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

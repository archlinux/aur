# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Vitor Rodrigues <vitor.rodrigues@gmail.com>
# Contributor: Jorge Cervantes <jorge.cervantes.e@gmail.com>

pkgname=msodbcsql
pkgver=18.5.1.1
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 18 for SQL Server®"
arch=('x86_64' 'aarch64')
url="https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
options=('!strip')
source_x86_64=(https://packages.microsoft.com/rhel/9/prod/Packages/m/msodbcsql18-18.5.1.1-1.x86_64.rpm)
source_aarch64=(https://packages.microsoft.com/rhel/9/prod/Packages/m/msodbcsql18-18.5.1.1-1.aarch64.rpm)
sha256sums_x86_64=('d673862afce09aa13665096bcb6bd3151c57b8e1a5b54d64a7aa8cbea37e618f')
sha256sums_aarch64=('47989cdbaa2a9004a071d60c1fe42775dcf172391cde3a5819b7ff21168971ca')
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

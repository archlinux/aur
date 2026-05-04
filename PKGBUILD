# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Vitor Rodrigues <vitor.rodrigues@gmail.com>
# Contributor: Jorge Cervantes <jorge.cervantes.e@gmail.com>

pkgname=msodbcsql
pkgver=18.6.2.1
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 18 for SQL Server®"
arch=('x86_64' 'aarch64')
url="https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
options=('!strip')
source_x86_64=(https://packages.microsoft.com/rhel/9/prod/Packages/m/msodbcsql18-18.6.2.1-1.x86_64.rpm)
source_aarch64=(https://packages.microsoft.com/rhel/9/prod/Packages/m/msodbcsql18-18.6.2.1-1.aarch64.rpm)
sha256sums_x86_64=('97f7e399d5cbbe6950b9ef2e5afd49501aacdfb6745eff15bcd6fdf88a8326fd')
sha256sums_aarch64=('53618eb24d7df0202b086ddb9018c9185146aa62d145115f49fed43f39700d4e')
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

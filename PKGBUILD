# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=13.1.4.0
pkgrel=2
pkgdesc="Microsoft® ODBC Driver 13 for SQL Server®"
arch=('x86_64')
url="https://blogs.msdn.microsoft.com/sqlnativeclient/"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
makedepends=('patchelf')
options=('!strip')
source=(https://packages.microsoft.com/rhel/7/prod/msodbcsql-$pkgver-1.x86_64.rpm)
sha256sums=('402eb8f7ebf2957cb800589787554376d5624b00b76fedf9a41e2e5f2a602cbe')
install=msodbcsql.install

package() {
  mv usr/share/{doc,licenses}
  mv usr opt "$pkgdir"

  cd "$pkgdir"/opt/microsoft/msodbcsql/lib64/
  ln -s /usr/lib/libcrypto.so.1.0.0 libcrypto.so.10
  ln -s /usr/lib/libssl.so.1.0.0 libssl.so.10
  patchelf --set-rpath /opt/microsoft/msodbcsql/lib64/ libmsodbcsql-*
}

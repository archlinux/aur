# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=13.1.4.0
pkgrel=3
pkgdesc="Microsoft® ODBC Driver 13 for SQL Server®"
arch=('x86_64')
url="https://blogs.msdn.microsoft.com/sqlnativeclient/"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
makedepends=('patchelf')
options=('!strip')
source=(https://packages.microsoft.com/rhel/7/prod/msodbcsql-$pkgver-1.x86_64.rpm
        http://mirror.centos.org/centos/7/os/x86_64/Packages/openssl-libs-1.0.1e-60.el7.x86_64.rpm)
sha256sums=('402eb8f7ebf2957cb800589787554376d5624b00b76fedf9a41e2e5f2a602cbe'
            '8a36abefd04bbbe8272650afb80c516b592e4e065faac131144e047204ace7dd')
install=msodbcsql.install

package() {
  mv usr/share/{doc,licenses}
  mv usr/lib64/lib*.so.* opt/microsoft/msodbcsql/lib64/
  rm -rf usr/lib64
  mv usr opt "$pkgdir"

  cd "$pkgdir"/opt/microsoft/msodbcsql/lib64/
  patchelf --set-rpath /opt/microsoft/msodbcsql/lib64/ libmsodbcsql-*
}

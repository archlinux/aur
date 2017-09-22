# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql
pkgver=13.1.9.1
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 13 for SQL Server®"
arch=('x86_64')
url="https://blogs.msdn.microsoft.com/sqlnativeclient/"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
makedepends=('patchelf')
options=('!strip')
source=(https://packages.microsoft.com/rhel/7/prod/msodbcsql-$pkgver-1.x86_64.rpm
        http://mirror.centos.org/centos/7/os/x86_64/Packages/openssl-libs-1.0.2k-8.el7.x86_64.rpm)
sha256sums=('556dcef0b6ca1a5f5a0dc527dcb828e1bb1e3f9712f65b69456095be80696c96'
            '3e355d70d78d8578ccc1dc474948dc5a8fd4b4e4c9508ff7321488c0e4796bf1')
install=msodbcsql.install

package() {
  mv usr/share/{doc,licenses}
  mv usr/lib64/lib*.so.* opt/microsoft/msodbcsql/lib64/
  rm -rf usr/lib64
  mv usr opt "$pkgdir"

  cd "$pkgdir"/opt/microsoft/msodbcsql/lib64/
  patchelf --set-rpath /opt/microsoft/msodbcsql/lib64/ libmsodbcsql-*
}

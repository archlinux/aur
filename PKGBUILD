# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-tools
pkgver=14.0.3.0
pkgrel=5
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
makedepends=('patchelf')
options=('!strip')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$pkgver-1.x86_64.rpm")
sha256sums=('9db9907a8151648d211bd8005c2b87ffebeca9b43c25ee56e9640804a72eaee6')

package() {
  cd "$srcdir"
  mv usr/share/{doc,licenses}
  mv usr opt "$pkgdir"

  install -dm755 "$pkgdir"/usr/bin/

  cd "$pkgdir"/opt/$pkgname/bin
  for bin in *; do
    patchelf --set-rpath /opt/microsoft/msodbcsql/lib64 $bin
    ln -s /opt/$pkgname/bin/$bin "$pkgdir"/usr/bin/$bin
  done
}

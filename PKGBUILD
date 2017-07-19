# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-tools
pkgver=14.0.6.0
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
makedepends=('patchelf')
options=('!strip')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$pkgver-1.x86_64.rpm")
sha512sums=('be764af995eb4852e60e3334936642fbcc5318ef4f6936f3a6dc989a743d6d166bcf4e289466f582c99d3a7b9073b8c30a5021df37b0d456facd24be5c01e543')

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

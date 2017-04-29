# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-tools
pkgver=14.0.5.0
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
makedepends=('patchelf')
options=('!strip')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$pkgver-1.x86_64.rpm")
sha512sums=('648fbc212d6569362bb1b5c0f11f917c787e5a1eb8b629751b1fb9ff0171e562d69b5c9f139b43e37eb06d027c23046dd2e10e677eecf31e4b2e0e5f4200a5b8')

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

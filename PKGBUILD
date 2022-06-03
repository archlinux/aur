# Maintainer: Karuna Murti <karuna.murti@gmail.com>
pkgname=mssql-tools
pkgver=18.0.1.1
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
options=('!strip')
source=("https://packages.microsoft.com/rhel/8/prod/${pkgname}18-$pkgver-1.x86_64.rpm")
sha512sums=('81b2ab5dbda99f0612bf71ad4434df2d4fc137d80813bfb3ea9a46a8ae6bc766a5172a7594eb6e623fcd8ec463671fef701a04ce0ac82b0275131ebba1a3afb9')

package() {
  cd "$srcdir"
  mv usr/share/{doc,licenses}
  mv usr/share/licenses/{${pkgname}18,$pkgname}
  mv opt/{${pkgname}18,$pkgname}
  mv usr opt "$pkgdir"

  install -dm755 "$pkgdir"/usr/bin/

  cd "$pkgdir"/opt/$pkgname/bin
  for bin in *; do
    ln -s ../../opt/$pkgname/bin/"$bin" "$pkgdir"/usr/bin/"$bin"
  done
}

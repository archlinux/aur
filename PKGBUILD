# Maintainer: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=14.0.200.24
_prodver=${pkgver}-2
pkgrel=2
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=(python2-configparser numactl)
makedepends=(rpmextract)
source=("https://packages.microsoft.com/rhel/7/$pkgname/$pkgname-$_prodver.x86_64.rpm")
md5sums=('d498ce2395cca3d094152bc84a9575e5')
noextract=("$pkgname-$_prodver.x86_64.rpm")
install=$pkgname.install

package() {
  cd "$pkgdir"
  rpmextract.sh $srcdir/$pkgname-$_prodver.x86_64.rpm
  ln -s /usr/lib/libssl.so.1.0.0 usr/lib/libssl.so.10
  ln -s /usr/lib/libcrypto.so.1.0.0 usr/lib/libcrypto.so.10
  sed 's/^exec/exec python2/' opt/mssql/bin/mssql-conf -i
}

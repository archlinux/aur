# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: Laurent Hofer <laurenth at laurenth dot net>

pkgname=brickd
pkgver=2.3.1
_pkgver=${pkgver}
pkgrel=1
pkgdesc="a brick daemon for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
depends=('libusbx')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${_pkgver}.zip https://github.com/Tinkerforge/daemonlib/archive/${pkgname}-${_pkgver}.zip brickd.service)
md5sums=('8e1a12cc58493245cc5e4500e6fbc002'
         '2f4a4a17a8ee393df79f5c41ca48a0c1'
         'e2ac9b32b8282d25ecc1ed8fc7f5cd73')
build() {
  cd $srcdir
  mv daemonlib-$pkgname-$_pkgver $pkgname-$_pkgver/src/daemonlib
  cd $pkgname-$_pkgver/src/brickd
  make
}

package() {
  install -Dm755 $srcdir/$pkgname-$_pkgver/src/brickd/brickd $pkgdir/usr/bin/brickd
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/installer/etc/brickd-default.conf $pkgdir/etc/brickd.conf
  install -Dm644 $srcdir/brickd.service $pkgdir/usr/lib/systemd/system/brickd.service
}

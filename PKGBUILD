# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: Laurent Hofer <laurenth at laurenth dot net>

pkgname=brickd
pkgver=2.2.1hf1
_pkgver=2.2.1-hf1
pkgrel=2
pkgdesc="a brick daemon for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
depends=('libusbx')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${_pkgver}.zip https://github.com/Tinkerforge/daemonlib/archive/${pkgname}-${_pkgver}.zip brickd.service)
md5sums=('0f4b4823950124751483d36993fd31b9'
         '48419e36ef3bbd75384716519e669b1d'
         'e2ac9b32b8282d25ecc1ed8fc7f5cd73')
build() {
  cd $srcdir
  mv daemonlib-$pkgname-$_pkgver $pkgname-$_pkgver/src/daemonlib
  cd $pkgname-$_pkgver/src/brickd
  make
}

package() {
  install -Dm755 $srcdir/$pkgname-$_pkgver/src/brickd/brickd $pkgdir/usr/bin/brickd
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/etc/brickd-default.conf $pkgdir/etc/brickd.conf
  install -Dm644 $srcdir/brickd.service $pkgdir/usr/lib/systemd/system/brickd.service
}

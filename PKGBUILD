# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: Laurent Hofer <laurenth at laurenth dot net>

pkgname=brickd
pkgver=2.3.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="a brick daemon for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
depends=('libusbx')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${_pkgver}.zip https://github.com/Tinkerforge/daemonlib/archive/${pkgname}-${_pkgver}.zip brickd.service)
md5sums=('95bc020ffe9fa583a1c6a5a43130ec7f'
         '6f49b22adaeb1bf9eafbbc1bc90b11fa'
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

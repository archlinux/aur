# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Co-Maintainer: Erik Fleckstein <erik at tinkerforge dot com>
# Contributor: Laurent Hofer <laurenth at laurenth dot net>

pkgname=brickd
pkgver=2.4.4
_pkgver=${pkgver}
pkgrel=1
pkgdesc="a brick daemon for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('libusb')
source=(https://download.tinkerforge.com/apt/debian/pool/main/t/tinkerforge-${pkgname}/tinkerforge-${pkgname}_${_pkgver}.tar.xz brickd.install)
sha256sums=('97f78d24921870717a6bb7c62e363f9d2afe82d7742a982536aa13e068092222'
            'c70f47a66e5c538e255bfd93111fe1a4ea15894db9c377ed133f8a0351403589')
install='brickd.install'
build() {
  cd $srcdir/tinkerforge-$pkgname-$_pkgver/brickd
  make
}

package() {
  install -Dm755 $srcdir/tinkerforge-$pkgname-$_pkgver/brickd/brickd $pkgdir/usr/bin/brickd
  install -Dm644 $srcdir/tinkerforge-$pkgname-$_pkgver/build_data/linux/installer/etc/brickd-default.conf $pkgdir/etc/brickd.conf
  install -Dm644 $srcdir/tinkerforge-$pkgname-$_pkgver/build_data/linux/installer/etc/logrotate.d/brickd $pkgdir/etc/logrotate.d/brickd
  install -Dm644 $srcdir/tinkerforge-$pkgname-$_pkgver/build_data/linux/installer/lib/systemd/system/brickd-resume.service $pkgdir/usr/lib/systemd/system/brickd-resume.service
  install -Dm644 $srcdir/tinkerforge-$pkgname-$_pkgver/build_data/linux/installer/lib/systemd/system/brickd.service $pkgdir/usr/lib/systemd/system/brickd.service
  install -Dm644 $srcdir/tinkerforge-$pkgname-$_pkgver/debian/copyright $pkgdir/usr/share/doc/brickd/copyright
  install -Dm644 $srcdir/tinkerforge-$pkgname-$_pkgver/build_data/linux/installer/usr/share/man/man5/brickd.conf.5 $pkgdir/usr/share/man/man5/brickd.conf.5
  install -Dm644 $srcdir/tinkerforge-$pkgname-$_pkgver/build_data/linux/installer/usr/share/man/man8/brickd.8 $pkgdir/usr/share/man/man8/brickd.8
}

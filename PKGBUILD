# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Co-Maintainer: Erik Fleckstein <erik at tinkerforge dot com>
# Contributor: Laurent Hofer <laurenth at laurenth dot net>

pkgname=brickd
pkgver=2.4.1
_pkgver=${pkgver}
pkgrel=2
pkgdesc="a brick daemon for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
depends=('libusb')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${_pkgver}.zip https://github.com/Tinkerforge/daemonlib/archive/${pkgname}-${_pkgver}.zip brickd.install)
sha256sums=('d1d843023edf4de6e1018a5fd7196fd121776d9b07091fe66ca3b87b5bc67bbe'
         'd90854f30d1a9a4792bfa6ee17c0450090ce2fe9d9c7cfe293e7f952e9ded04b'
         'c70f47a66e5c538e255bfd93111fe1a4ea15894db9c377ed133f8a0351403589')
install='brickd.install'
build() {
  cd $srcdir
  mv daemonlib-$pkgname-$_pkgver $pkgname-$_pkgver/src/daemonlib
  cd $pkgname-$_pkgver/src/brickd
  make
}

package() {
  install -Dm755 $srcdir/$pkgname-$_pkgver/src/brickd/brickd $pkgdir/usr/bin/brickd
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/installer/etc/brickd-default.conf $pkgdir/etc/brickd.conf
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/installer/etc/logrotate.d/brickd $pkgdir/etc/logrotate.d/brickd
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/installer/lib/systemd/system/brickd-resume.service $pkgdir/usr/lib/systemd/system/brickd-resume.service
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/installer/lib/systemd/system/brickd.service $pkgdir/usr/lib/systemd/system/brickd.service
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/installer/usr/share/doc/brickd/copyright $pkgdir/usr/share/doc/brickd/copyright
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/installer/usr/share/man/man5/brickd.conf.5 $pkgdir/usr/share/man/man5/brickd.conf.5
  install -Dm644 $srcdir/$pkgname-$_pkgver/src/build_data/linux/installer/usr/share/man/man8/brickd.8 $pkgdir/usr/share/man/man8/brickd.8
}

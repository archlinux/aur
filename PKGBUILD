# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: gnud <gnud@gawab.com> 

pkgname=midisport-firmware
pkgver=1.2
pkgrel=5
pkgdesc="Firmware for some (legacy) m-audio midi devices"
url="http://usb-midi-fw.sourceforge.net/"
arch=('any')
depends=('alsa-lib' 'fxload' 'udev')
license=('GPL-2.0-or-later')
source=("http://downloads.sourceforge.net/project/usb-midi-fw/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        "midisport_udev_rules.patch")
md5sums=('b1e4976b68f396a50e92491caa6f36bc'
         'b740f29541e719e44780d5a573573f6d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 1740c\ 'udev_ver=\`udevadm info -V\`' configure
  patch < $srcdir/midisport_udev_rules.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:

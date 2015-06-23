# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: gnud <gnud@gawab.com> 

pkgname=midisport-firmware
pkgver=1.2
pkgrel=3
pkgdesc="Firmware for some (legacy) m-audio midi devices"
url="http://usb-midi-fw.sourceforge.net/"
arch=('any')
depends=('alsa-lib' 'fxload')
license=('gpl')
source=("http://downloads.sourceforge.net/project/usb-midi-fw/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        "midisport_udev_rules.patch")
md5sums=('b1e4976b68f396a50e92491caa6f36bc'
         '46fdfedc6fc7ca7a257dfbd401c204e0')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  sed -i 1740c\ 'udev_ver=\`udevadm info -V\`' configure
  patch < ../../midisport_udev_rules.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:


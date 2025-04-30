# Contributor: Jochen Immendörfer <jochen dot immendoerfer at gmail dot com>
# Maintainer: philanecros <philanecros at gmail dot com>
# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=fxload
pkgver=1.0.28
pkgrel=1
pkgdesc='fxload firmware loader. Used with udev or devfs/hotplug.'
arch=('aarch64' 'x86_64')
url='http://libusb.info/'
license=('LGPL')
depends=('libusb')
makedepends=(autoconf automake pkgconf)
source=("https://github.com/libusb/libusb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('378b3709a405065f8f9fb9f35e82d666defde4d342c2a1b181a9ac134d23c6fe')

build() {
  cd "libusb-$pkgver"
  bash autogen.sh
  cd libusb
  make
  cd ../examples
  gcc $CFLAGS $(pkg-config --libs --cflags libusb-1.0) -I ../ -I ../libusb fxload.c ezusb.c -o fxload
}


package () {
  cd "libusb-$pkgver/examples"
  install -m 755 -D fxload $pkgdir/usr/bin/fxload
}

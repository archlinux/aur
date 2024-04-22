# Contributor: Jochen Immendörfer <jochen dot immendoerfer at gmail dot com>
# Maintainer: philanecros <philanecros at gmail dot com>
# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=fxload
pkgver=1.0.26
pkgrel=1
pkgdesc='fxload firmware loader. Used with udev or devfs/hotplug.'
arch=('aarch64' 'x86_64')
url='http://libusb.info/'
license=('LGPL')
depends=('libusb')
makedepends=(autoconf automake pkgconf)
source=("https://github.com/libusb/libusb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a09bff99c74e03e582aa30759cada218ea8fa03580517e52d463c59c0b25e240')

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

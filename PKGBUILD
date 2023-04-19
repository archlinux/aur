pkgname=fxload-libusb
_spkgname=libusb
pkgver=1.0.26
pkgrel=2
pkgdesc='fxload from the libusb examples'
arch=('i686' 'x86_64' 'aarch64')
url='http://libusb.info/'
license=('LGPL')
depends=('libusb')
source=(https://github.com/libusb/libusb/releases/download/v$pkgver/libusb-$pkgver.tar.bz2)
sha256sums=('12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5')

build() {
  cd $_spkgname-$pkgver
  ./configure
  cd examples
  gcc $CFLAGS $(pkg-config --libs --cflags libusb-1.0) fxload.c ezusb.c -I.. -o fxload-libusb
}


package () {
  cd $_spkgname-$pkgver/examples
  install -m 755 -D fxload-libusb $pkgdir/usr/bin/fxload-libusb
}

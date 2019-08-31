# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libphidget
pkgver=2.1.9.20190409
pkgrel=1
pkgdesc="user-space access library for the Phidget devices"
arch=('x86_64')
license=('GPL')
depends=('libusb')
makedepends=('libusb')
source=('https://www.phidgets.com/downloads/libraries/libphidget.tar.gz')
sha256sums=('0e789912700228808519cf5c41e19f9b761da635c6bb676b147897936b23851f')

build() {
   cd $pkgname-$pkgver
   ./configure --prefix=/usr
   make
}

package() {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
   install -d "$pkgdir"/usr/lib/udev/rules.d
   install "udev/99-phidgets.rules" "$pkgdir"/usr/lib/udev/rules.d
}

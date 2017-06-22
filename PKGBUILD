pkgname=libphidget
pkgver=2.1.8
pkgdate=20151217
pkgrel=2
pkgdesc="user-space access library for the Phidget devices"
arch=('x86_64')
license=('GPL')
depends=('libusb')
makedepends=('libusb')
source=(
   'https://www.phidgets.com/downloads/libraries/libphidget.tar.gz'
)
sha256sums=(
   '7393273fdefbb6cfb67f1a69fd2f140e0c0e396e9b7350400195cedbf1d4ea52'
)

build() {
   cd $srcdir/$pkgname-$pkgver.$pkgdate
   ./configure --prefix=/usr
}

package() {
   cd $srcdir/$pkgname-$pkgver.$pkgdate
   make DESTDIR="$pkgdir/" install

   install -d "${pkgdir}/usr/lib/udev/rules.d"
   install "udev/99-phidgets.rules" "${pkgdir}/usr/lib/udev/rules.d"
}

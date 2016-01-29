# Contributor: Techmeology <techmeology@techmeology.co.uk>
# Maintainer: DanielH <danielmirkin@gmail.com>

# NOTE
# Add usbpicprog's user(s) to the uucp group, to allow communicate with hardware through USB ports:
# sudo gpasswd -a $USER uucp

pkgname=usbpicprog
pkgver=140617
pkgrel=1
pkgdesc="Software and firmware for the USB PIC Programmer: usbpicprog"
arch=('i686' 'x86_64')
url="http://usbpicprog.org/"
license=('GPL2')
depends=('wxgtk>=2.9' 'libusb')
conflicts=('usbpicprog-beta')
source=(http://usbpicprog.org/downloads/usbpicprog-$pkgver.tar.gz)
md5sums=('050d21aae3d22409d1dc067f6e0cb216') #generate with 'makepkg -g'

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|/lib/udev/rules.d|/usr/lib/udev/rules.d|g' Makefile.in
}


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Kyle Keen <keenerd@gmail.com>
# Creator: Peter Feigl <craven@gmx.net>
# Modified: Josh Kropf <josh@slashdev.ca>
pkgname=teensy-loader-cli
pkgver=2.1
pkgrel=2
pkgdesc="Command line loader for the teensy microprocessor boards"
arch=('i686' 'x86_64')
url="http://www.pjrc.com/teensy/loader_cli.html"
license=('GPL2')
depends=('libusb-compat')
source=(
  "http://www.pjrc.com/teensy/${pkgname//-/_}.${pkgver}.zip"
  "http://www.pjrc.com/teensy/49-teensy.rules")
md5sums=('c27a8a970f32b60e5bb12b70cb52dd42'
         '97a691215b1865bc1d500b134f92427b')

build() {
  cd "$srcdir/${pkgname//-/_}"
  make
}

package() {
  cd "$srcdir/${pkgname//-/_}"
  install -Dm755 teensy_loader_cli "$pkgdir/usr/bin/teensy-loader-cli"
  install -Dm644 "$srcdir/49-teensy.rules" "$pkgdir/etc/udev/rules.d/49-teensy.rules"
}

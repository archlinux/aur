# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-hciconfig
pkgver=5.63
pkgrel=1
pkgdesc="deprecated hciconfig tool from bluez"
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL2')
depends=("bluez")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('9349e11e8160bb3d720835d271250d8a7424d3690f5289e6db6fe07cc66c6d76')

build() {
  cd bluez-${pkgver}/tools
  gcc hciconfig.c parser/{csr,parser,lmp}.c ../src/textfile.c -lbluetooth -o hciconfig -DVERSION=\"$pkgver\" -I..
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 hciconfig "$pkgdir"/usr/bin/hciconfig
  install -Dm0755 hciconfig.1 "$pkgdir"/usr/share/man/man1/hciconfig.1
}

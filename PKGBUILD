# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-hciconfig
pkgver=5.58
pkgrel=1
pkgdesc="deprecated hciconfig tool from bluez"
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL2')
depends=("bluez")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1')

build() {
  cd bluez-${pkgver}/tools
  gcc hciconfig.c parser/{csr,parser,lmp}.c ../src/textfile.c -lbluetooth -o hciconfig -DVERSION=\"$pkgver\" -I..
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 hciconfig "$pkgdir"/usr/bin/hciconfig
  install -Dm0755 hciconfig.1 "$pkgdir"/usr/share/man/man1/hciconfig.1
}

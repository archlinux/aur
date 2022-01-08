# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-hcitool
pkgver=5.63
pkgrel=1
pkgdesc="deprecated hcitool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('9349e11e8160bb3d720835d271250d8a7424d3690f5289e6db6fe07cc66c6d76')

build() {
  cd bluez-${pkgver}/tools
  gcc hcitool.c ../src/oui.c -lbluetooth -o hcitool -DVERSION=\"$pkgver\" -I..
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 hcitool "$pkgdir"/usr/bin/hcitool
  install -Dm0755 hcitool.1 "$pkgdir"/usr/share/man/man1/hcitool.1
}

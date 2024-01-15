# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-hcitool
pkgver=5.72
pkgrel=1
pkgdesc="deprecated hcitool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez-libs")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e')

build() {
  cd bluez-${pkgver}/tools
  gcc hcitool.c ../src/oui.c -lbluetooth -o hcitool -DVERSION=\"$pkgver\" -I..
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 hcitool "$pkgdir"/usr/bin/hcitool
  install -Dm0755 hcitool.1 "$pkgdir"/usr/share/man/man1/hcitool.1
}

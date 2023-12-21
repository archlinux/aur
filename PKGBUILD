# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-hcitool
pkgver=5.71
pkgrel=1
pkgdesc="deprecated hcitool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez-libs")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('b828d418c93ced1f55b616fb5482cf01537440bfb34fbda1a564f3ece94735d8')

build() {
  cd bluez-${pkgver}/tools
  gcc hcitool.c ../src/oui.c -lbluetooth -o hcitool -DVERSION=\"$pkgver\" -I..
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 hcitool "$pkgdir"/usr/bin/hcitool
  install -Dm0755 hcitool.1 "$pkgdir"/usr/share/man/man1/hcitool.1
}

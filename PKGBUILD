# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-rfcomm
pkgver=5.69
pkgrel=1
pkgdesc="deprecated rfcomm tool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('bc5a35ddc7c72d0d3999a0d7b2175c8b7d57ab670774f8b5b4900ff38a2627fc')

build() {
  cd bluez-${pkgver}
  gcc tools/rfcomm.c lib/bluetooth.c lib/hci.c -o tools/rfcomm -DVERSION=\"$pkgver\" -I.
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 rfcomm "$pkgdir"/usr/bin/rfcomm
  install -Dm0755 rfcomm.1 "$pkgdir"/usr/share/man/man1/rfcomm.1
}

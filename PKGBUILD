# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-rfcomm
pkgver=5.71
pkgrel=1
pkgdesc="deprecated rfcomm tool from bluez"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("bluez")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('b828d418c93ced1f55b616fb5482cf01537440bfb34fbda1a564f3ece94735d8')

build() {
  cd bluez-${pkgver}
  gcc tools/rfcomm.c lib/bluetooth.c lib/hci.c -o tools/rfcomm -DVERSION=\"$pkgver\" -I.
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 rfcomm "$pkgdir"/usr/bin/rfcomm
  install -Dm0755 rfcomm.1 "$pkgdir"/usr/share/man/man1/rfcomm.1
}

# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bluez-hciconfig
pkgver=5.66
pkgrel=1
pkgdesc="deprecated hciconfig tool from bluez"
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL2')
depends=("bluez-libs")
source=(https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
sha256sums=('39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f4698677ab2b574')

build() {
  cd bluez-${pkgver}/tools
  gcc hciconfig.c parser/{csr,parser,lmp}.c ../src/textfile.c \
    -lbluetooth -o hciconfig \
    -DVERSION=\"$pkgver\" \
    -DSTORAGEDIR=\"/var/lib/bluetooth\" \
    -I..
}

package() {
  cd bluez-${pkgver}/tools
  install -Dm0755 hciconfig "$pkgdir"/usr/bin/hciconfig
  install -Dm0755 hciconfig.1 "$pkgdir"/usr/share/man/man1/hciconfig.1
}

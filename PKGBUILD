# Maintainer: Franck Duriez <franck@duriez.info>

pkgname=ixxat-socketcan
pkgver=2.0.520
pkgrel=1
pkgdesc="SocketCAN driver for IXXAT USB-to-CAN v2"
arch=('i686' 'x86_64')
url="https://www.hms-networks.com/support/general-downloads"
license=('GPL2')
makedepends=(linux-headers)
optdepends=('can-utils: Linux-CAN / SocketCAN user space applications')
install=$pkgname.install
source=('https://hmsnetworks.blob.core.windows.net/nlw/docs/default-source/products/ixxat/monitored/pc-interface-cards/socketcan-linux.gz?sfvrsn=3eb48d7_89&download=true')
sha256sums=('dd34dfb4e1c988693c2b6799c467ba7689758c9757fa8e8e4890fa7715b818b6')

_extramodules=$(uname -r)/extramodules

prepare() {
  cd "$srcdir"
  tar xzfv "ix_usb_can_2.0.520-REL.tgz"
}

build() {
  cd "$srcdir"
  make
}

package() {
  mkdir -p "$pkgdir/usr/lib/modules/$_extramodules"
  install "$srcdir/kernel/drivers/net/can/usb/ixxat_usb/ix_usb_can.ko" "$pkgdir/usr/lib/modules/$_extramodules"
}


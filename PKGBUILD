# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

pkgname=ixxat-socketcan
pkgver=1.1.148.0
pkgrel=5
pkgdesc="SocketCAN driver for IXXAT USB-to-CAN v2"
arch=('i686' 'x86_64')
url="https://www.ixxat.com/products/products-industrial/pc-interfaces/pc-can-interfaces/socketcan"
license=('GPL2')
makedepends=(linux-headers)
optdepends=('can-utils: Linux-CAN / SocketCAN user space applications')
install=$pkgname.install
source=('https://www.ixxat.com/docs/librariesprovider8/default-document-library/downloads/other-drivers/socketcan.zip?sfvrsn=c486dcd6_22'
	kernel_api_fix.patch)
md5sums=('c42d19b75802691b057a8163606903af'
         '94db6b37a2b8f07ef116352e73dbd88a')

_extramodules=$(uname -r)/extramodules

prepare() {
	patch -p1 -i kernel_api_fix.patch
}

build() {
	make
}

package() {
	mkdir -p $pkgdir/usr/lib/modules/$_extramodules
	install usb-to-can_socketcan/ixx_usb.ko $pkgdir/usr/lib/modules/$_extramodules
}

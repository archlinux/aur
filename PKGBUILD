# Maintainer: Henri Derycke <henri.derycke@gmail.com>
pkgname=usb-pc-link
pkgver=0.1
pkgrel=2
pkgdesc="Make usb audio work for MC-M530 HiFi"
arch=('x86_64')
url="https://github.com/nheir/usb_pc_link"
license=('GPL')
depends=('libusb-compat')
makedepends=('git')
source=(${pkgname}::'git+http://github.com/nheir/usb_pc_link.git#commit=3f79b8232fbdd388f007578a59cfe4f90c7978cf')
md5sums=('SKIP')
build() {
	cd "$srcdir/${pkgname}"
	gcc -Wall -o usb_pc_link usb_pc_link.c -lusb
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 usb_pc_link "${pkgdir}/usr/bin/usb_pc_link"
	install -Dm644 archlinux/81-usb-pc-link.rules "${pkgdir}/etc/udev/rules.d/81-usb-pc-link.rules"
}

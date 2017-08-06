# Author: Dominic Radermacher <dominic.radermacher@gmail.com>
pkgname=lan951x-led-ctl
pkgver=1.0r3.0291b91
pkgrel=1
pkgdesc="Command line tool to control the LED's of a LAN9512/LAN9514 ethernet controller"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://mockmoon-cybernetics.ch/computer/raspberry-pi/lan951x-led-ctl/"
license=('GPL2')
makedepends=('git')
depends=('libusb>=1.0')
source=(git://github.com/dradermacher/${pkgname}.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local ver=$(grep -w VERSION include/lan951x-led-ctl.h |cut -d' ' -f3 |sed -e 's/"//g')
	printf "%sr%s.%s" "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "${srcdir}/${pkgname}"
	make
}
package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} install
}

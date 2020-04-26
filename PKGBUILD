# Author: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
pkgname=lan951x-led-ctl
pkgver=1.0.r5.g36f3259
pkgrel=1
pkgdesc="Command line tool to control the LED's of a LAN9512/LAN9514 ethernet controller"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://mockmoon-cybernetics.ch/computer/raspberry-pi/lan951x-led-ctl/"
license=('GPL2')
makedepends=('git')
depends=('libusb>=1.0')
source=(git+https://mockmoon-cybernetics.ch/cgi/cgit/linux/${pkgname}.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
build() {
	cd "${srcdir}/${pkgname}"
	make
}
package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} install
}

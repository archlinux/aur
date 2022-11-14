# Author: Dominic Radermacher <dominic@familie-radermacher.ch>
pkgname=lan951x-led-ctl
pkgver=1.0.r9.g0443d24
pkgrel=2
pkgdesc="Command line tool to control the LED's of a LAN9512/LAN9514 ethernet controller"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64' 'riscv64')
url="https://dominic.familie-radermacher.ch/computer/raspberry-pi/lan951x-led-ctl/"
license=('GPL2')
makedepends=('cmake' 'git')
depends=('libusb>=1.0')
source=(git+https://git.familie-radermacher.ch/linux/${pkgname}.git)
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
	mkdir -p build && cmake --fresh -B build && cmake --build build
}
package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR=${pkgdir} cmake --install build
}

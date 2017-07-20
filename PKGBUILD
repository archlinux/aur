# Author: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
pkgname=ptouch
pkgver=v1.3.4.r0.g24ef8a0
pkgrel=1
pkgdesc="Command line tool to print text or graphic labels on Brother P-touch printers like PT-2430PC"
arch=('x86_64' 'i686' 'armv7h' 'armv6h')
url="https://mockmoon-cybernetics.ch/computer/p-touch2430pc/"
license=('GPL2')
makedepends=('git' 'autoconf')
depends=('libusb>=1.0' 'gd>=2.0.16')
source=(git://github.com/dradermacher/ptouch-print.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/ptouch-print"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
build() {
	cd ${srcdir}/ptouch-print
	autoreconf -i
	./configure --prefix=/usr
	make
}
package() {
	cd ${srcdir}/ptouch-print
	make DESTDIR=${pkgdir} install
}

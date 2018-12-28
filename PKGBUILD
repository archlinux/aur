# Author: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
pkgname=ptouch
pkgver=1.3.4.r15.g72d1cc7
pkgrel=1
pkgdesc="Command line tool to print text or graphic labels on Brother P-touch printers like PT-2430PC"
arch=('x86_64' 'i686' 'armv7h' 'armv6h')
url="https://mockmoon-cybernetics.ch/computer/p-touch2430pc/"
license=('GPL2')
makedepends=('git' 'autoconf')
depends=('libusb>=1.0' 'gd>=2.0.16')
source=(git+https://mockmoon-cybernetics.ch/cgi/cgit/ptouch-print.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/ptouch-print"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
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

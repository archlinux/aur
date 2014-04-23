pkgname='reop-git'
pkgrel=1
pkgver=11
pkgdesc='Utility to create and verifies cryptographic signatures'
url='https://github.com/tedu/reop/'
license=('MIT')
arch=('arm' 'i686' 'x86_64')
depends=('libsodium')
options=('zipman')
source=('git+https://github.com/tedu/reop.git')
md5sums=('SKIP')

pkgver () {
	cd "${srcdir}/reop"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${srcdir}/reop"
	make -f Makefile.other
}

package () {
	cd "${srcdir}/reop"
	install -m 755 -d "${pkgdir}/bin"
	install -m 755 -t "${pkgdir}/bin" reop
	install -m 755 -d "${pkgdir}/usr/share/man/man1"
	install -m 644 -t "${pkgdir}/usr/share/man/man1" reop.1
}

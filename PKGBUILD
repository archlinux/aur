# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Malina Salina <bluesilence@hotmail.co.uk>
pkgname='reop-git'
pkgrel=1
pkgver=138.81dc1b4
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
	sh ./configure
	make
}

check () {
	cd "${srcdir}/reop/tests"
	chmod +x test.sh
	./test.sh
}

package () {
	cd "${srcdir}/reop"
	install -Dm755 reop "${pkgdir}/usr/bin/reop"
	install -Dm644 reop.1 "${pkgdir}/usr/share/man/man1/reop.1"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

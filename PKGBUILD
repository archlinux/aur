# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='qc-git'
pkgdesc='C frontend for the QBE C compiler backend'
pkgver=r255.30053c1
pkgrel=1
url='https://github.com/andrewchambers/qc'
arch=('x86_64')
depends=('qbe-git')
makedepends=('myrddin-git')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')


pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	mbld
}

check () {
	cd "${pkgname}"
	mbld :tests
}

package () {
	cd "${pkgname}"
	install -Dm755 qc "${pkgdir}/usr/bin/qc"
	install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*.txt
}

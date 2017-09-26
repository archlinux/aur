# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='qc-git'
pkgdesc='C frontend for the QBE C compiler backend'
pkgver=r263.f25f9d3
pkgrel=3
url='https://github.com/andrewchambers/qc'
arch=('x86_64')
depends=('qbe-git')
license=('custom:MIT')
makedepends=('myrddin>=0.2.0')
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
	mbld test
}

package () {
	cd "${pkgname}"
	install -Dm755 obj/qc "${pkgdir}/usr/bin/qc"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*.txt
}

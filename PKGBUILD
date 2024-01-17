# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='farbfeld-resize-git'
pkgdesc='Farbfeld image resizing filter'
pkgver=r7.599494b
pkgrel=1
license=('Custom')
depends=('glibc')
makedepends=('git')
arch=('i686' 'x86_64')
url='https://github.com/ender672/farbfeld-resize'
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
	make
}

package () {
	cd "${pkgname}"
	install -Dm755 resize    "${pkgdir}/usr/bin/ffresize"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

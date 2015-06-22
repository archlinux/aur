# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='python-intheam-git'
pkgdesc='Python client module for the Inthe.AM REST API'
pkgver=r3.ce25800
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/aperezdc/intheam-python'
depends=('python-click')
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


package () {
	cd "${pkgname}"
	python3 setup.py install --root="${pkgdir}"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# Maintainer: Sierra410 <(my nickname)@protonmail.com>

pkgname='qsrv-git'
_pkgname="${pkgname%-git}"
pkgver=r34.3418fe7
pkgrel=1
pkgdesc="A simple config-file-less HTTP server for testing purposes; A more flexible alternative to \"python3 -m http.server\""
arch=('any')
url="https://gitlab.com/S410/qsrv"
license=('AGPL-3.0-only')
depends=('go')
makedepends=('git')
source=('git+https://gitlab.com/S410/qsrv.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/${_pkgname}"
	go build -o "${_pkgname}" -trimpath .
}

package() {
	cd "${_pkgname}"
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dvm644 README.MD -t "${pkgdir}/usr/share/doc/${pkgname}"
}

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

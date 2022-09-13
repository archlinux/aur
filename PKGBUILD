# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='ttf-mononoki-git'
pkgdesc='Monospace font for programmers, successor of monoOne'
pkgver=r108.2e74b72
pkgrel=1
arch=(any)
license=(custom:OFL)
url=https://github.com/madmalik/mononoki/
source=("${pkgname}::git+${url}#branch=main")
sha512sums=(SKIP)
conflicts=(ttf-mononoki)
provides=("${conflicts[@]}")
makedepends=(git)

pkgver () {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


package () {
	install -m755 -d "${pkgdir}/usr/share/fonts/ttf-mononoki"
	install -m644 -t "${pkgdir}/usr/share/fonts/ttf-mononoki" "${pkgname}"/export/*.ttf
	install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

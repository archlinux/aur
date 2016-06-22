pkgname='ttf-mononoki-git'
pkgdesc='Monospace font for programmers, successor of monoOne'
pkgver=r76.97b8bc4
pkgrel=1
arch=('any')
license=('custom:OFL')
depends=('fontconfig')
url='https://github.com/madmalik/mononoki/'
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
conflicts=('ttf-mononoki')
provides=( "${conflicts[@]}" )

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
	install -m644 -t "${pkgdir}/usr/share/fonts/ttf-mononoki" "${pkgname}"/export/webfont/*.ttf
	install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Katie Wolfe <wolfe@katie.host
pkgname=otb-tewi-git
pkgver=r313.a975d38
pkgrel=2
pkgdesc='Tiny bitmap font'
arch=('any')
url='https://github.com/lucy/tewi-font'
license=('MIT')
groups=()
depends=()
makedepends=('git' 'fonttosfnt')
provides=('otb-tewi')
conflicts=('otb-tewi')
source=('git+https://github.com/lucy/tewi-font.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/tewi-font"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/tewi-font"
	make var
	for f in *.bdf; do
		fonttosfnt -v -c -b -g 2 -m 1 -o "${f%.bdf}.otb" "${f}"
	done
}

package() {
	cd "${srcdir}/tewi-font"
	install -d -m755 "${pkgdir}/usr/share/fonts/misc"
	install -m644 -t "${pkgdir}/usr/share/fonts/misc/" *.otb
}

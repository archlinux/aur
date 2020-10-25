# Maintainer: Kian Kasad <kdkasad@gmail.com>
pkgname=dmenu-kian-git
pkgver=v5.0.r0.79dc276
pkgrel=1
pkgdesc="A customized build of dmenu by Kian Kasad"
arch=('any')
url="https://git.kasad.com/dmenu"
license=('MIT')
depends=('libxft')
makedepends=('git')
optdepends=('libxft-bgra: for BGRA graphics (emojis)')
provides=('dmenu')
conflicts=('dmenu')
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/${pkgname}/LICENSE"
}

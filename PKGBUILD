# Maintainer: Kian Kasad <kdkasad@gmail.com>

pkgname=dwm-kian-git
pkgver=v6.2.r1.deed7a6
pkgrel=1
pkgdesc="A customized version of dwm by Kian Kasad"
arch=('any')
url="https://git.kasad.com/dwm.git"
license=('MIT')
depends=('libx11' 'libxinerama' 'freetype2')
makedepends=('git')
optdepends=('libxft-bgra: for emojis in statusbar')
provides=('dwm')
conflicts=('dwm')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-kian-git}"

	# print version using latest tag/commit
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-kian-git}"
	make X11INC=/usr/include/X11/ X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "${srcdir}/${pkgname%-kian-git}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/${pkgname%-git}/LICENSE"
	install -Dm 644 dwm.desktop "${pkgdir}/usr/share/xsessions/dwm.desktop"
}

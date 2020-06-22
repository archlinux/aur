# Maintainer: Kian Kasad <kdkasad@gmail.com>
pkgname=dwm-kian-git
pkgver=6.2
_pkgver=6.2
pkgrel=2
pkgdesc="A customized version of dwm by Kian Kasad"
arch=('any')
url="https://gitlab.com/kdkasad/dwm.git"
license=('MIT')
depends=('libx11' 'libxinerama' 'freetype2')
makedepends=('git')
optdepends=('libxft-bgra: for emojis in statusbar')
provides=('dwm')
conflicts=('dwm')
install=
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-kian-git}"
	printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

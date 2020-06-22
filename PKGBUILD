# Maintainer: Kian Kasad <kdkasad@gmail.com>
pkgname=dmenu-kian-git
pkgver=4.9
_pkgver=4.9
pkgrel=3
pkgdesc="A customized build of dmenu by Kian Kasad"
arch=('any')
url="https://gitlab.com/kdkasad/dmenu.git"
license=('MIT')
depends=()
makedepends=('git')
optdepends=('libxft-bgra: for BGRA graphics (emojis)')
provides=('dmenu')
conflicts=('dmenu')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-kian-git}"
	printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-kian-git}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/${pkgname%-kian-git}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/${pkgname%-git}/LICENSE"
}

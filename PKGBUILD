# Maintainer: Kian Kasad <kdkasad@gmail.com>
pkgname=st-kian-git
pkgver=0.8.3
pkgrel=2
pkgdesc="A customized version of st by Kian Kasad"
arch=('any')
url="https://gitlab.com/kdkasad/st.git"
license=('MIT')
depends=()
makedepends=('git')
optdepends=('libxft-bgra: for BGRA graphics (emojis)')
provides=('st')
conflicts=('st')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-kian-git}"
	printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

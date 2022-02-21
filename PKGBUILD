# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=libyui-qt
pkgname=${_pkgname}-git
pkgver=4.2.23.r24.gb584b47f
pkgrel=1
pkgdesc="Libyui is a widget abstraction library providing Qt, GTK and ncurses frontends. Originally it was developed for YaST but it can be used in any independent project. This part contains the Qt graphical frontend."
arch=('x86_64')
url="https://github.com/libyui/libyui-qt"
license=('LGPLv3')
depends=('libyui')
provides=("${_pkgname}")
conflicts=()
epoch=1
source=(
	"${_pkgname}::git+https://github.com/libyui/libyui.git"
)

sha256sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}/${_pkgname}"
	cmake -G "Unix Makefiles" -S . -B build --install-prefix=/usr
	cmake --build build
}

package() {
	cd "${srcdir}/${_pkgname}/${_pkgname}/build"
	make DESTDIR="${pkgdir}/" install
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

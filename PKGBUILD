# Maintainer: ThiBsc <thibsc at tutanota dot com>
pkgname=flynote-git
_gitname=flynote
pkgver=r53.57a08ba
pkgrel=1
pkgdesc="A program to take note on desktop like a Post-It and share on LAN"
arch=('any')
url="https://github.com/thibsc/flynote"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
source=("git+${url}.git"
        "${_gitname}.desktop")
sha256sums=('SKIP'
	    '58c0116f4a41b5e5a0745a6bcdbf0586b8ea44baa33e10a461052f6db0877461')

pkgver() {
	cd ${srcdir}/${_gitname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${_gitname}
	mkdir build && cd build
	qmake -config release ../flynote.pro
	make
}

package() {
	install -Dm755 ${srcdir}/${_gitname}/build/${_gitname} ${pkgdir}/usr/bin/${_gitname}
	install -Dm644 ${srcdir}/${_gitname}/icons/note.png ${pkgdir}/usr/share/pixmaps/flynote.png
	install -Dm755 ${srcdir}/${_gitname}.desktop ${pkgdir}/usr/share/applications/${_gitname}.desktop
}


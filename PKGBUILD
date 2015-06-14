# Maintainer: Ondřej Hruška <ondra@ondrovo.com>
# Original author: Anselm R Garbe <anselm@garbe.us>

pkgname=slock-xtra-git
_pkgname=slock
pkgver=20141117.191388c
pkgrel=1
pkgdesc='Simple X display locker, with adjustable color and more intuitive behavior.'
url='https://github.com/MightyPork/slock'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libx11')
conflicts=('slock')
makedepends=('libxext' 'git')
source=('git://github.com/MightyPork/slock')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags | sed "s|-|.|g"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

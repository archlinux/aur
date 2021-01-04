# Maintainer: monosans <hsyqixco at protonmail dot com>

pkgname=dwm-monosans-git
pkgver=6.2.r1699.8a76189
pkgrel=1
pkgdesc='A dynamic window manager for X'
url="https://github.com/monosans/dwm"
arch=(i686 x86_64)
license=(MIT)
depends=(freetype2 libx11 libxinerama libxft)
makedepends=(git)
source=("git://github.com/monosans/dwm")
sha256sums=('SKIP')
provides=(dwm)
conflicts=(dwm)

pkgver() {
	cd dwm
	_pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
	echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd dwm
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd dwm
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

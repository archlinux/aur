# Maintainer: Alex Wiggins <alex.d.wiggins at gmail . com>

_pkgname=penguin-subtitle-player
pkgname=${_pkgname}-git
pkgver=v1.0.0.r7.1f61e87
pkgrel=1
pkgdesc="An open-source, cross-platform standalone subtitle player"
arch=('i686' 'x86_64')
url="https://github.com/carsonip/Penguin-Subtitle-Player/"
license=('GPL3')
depends=('qt5-base' 'libxkbcommon-x11' 'libsm') # qt5 and xcb plugin
makedepends=('git' 'qt5-base') # git and qmake-qt5
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${pkgname}")
source=("${pkgname}::git+https://github.com/carsonip/Penguin-Subtitle-Player.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	# automatically update version from git
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')" # Git, tags available
}

build() {
	cd "$srcdir/${pkgname}"

	# build using Qt Creator project file
	qmake-qt5 "PenguinSubtitlePlayer.pro"
	make
}

package() {
	cd "$srcdir/${pkgname}/build/release"

	# copy binary executable to package output for install by pacman
	install -D -m 755 "PenguinSubtitlePlayer" "$pkgdir/usr/bin/PenguinSubtitlePlayer"
}

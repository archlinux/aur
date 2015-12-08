# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sway-git
_pkgname=sway
pkgver=r896.155f5d2
pkgrel=1
license=('MIT')
pkgdesc='i3 compatible window manager for Wayland'
makedepends=("cmake" "git" "asciidoc")
depends=(
	"wlc-git" "xorg-server-xwayland"
	"xcb-util-image" "json-c"
	"pango" "cairo"
	"wayland" "gdk-pixbuf2"
)
optdepends=(
	"rxvt-unicode: default terminal emulator"
	"dmenu: default for launching applications"
	"imagemagick: for taking screenshots"
	"ffmpeg: for recording screencasts"
)
arch=("i686" "x86_64")
url='https://github.com/SirCmpwn/sway'
source=("${pkgname%-*}::git+https://github.com/SirCmpwn/sway.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"

	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	DESTDIR="$pkgdir/" make install
}

# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sway-git
_pkgname=sway
pkgver=r1461.54c635c
pkgrel=1
license=('MIT')
pkgdesc='i3 compatible window manager for Wayland'
makedepends=("cmake" "git" "asciidoc")
depends=(
	"wlc" "xorg-server-xwayland"
	"xcb-util-image" "json-c"
	"pango" "cairo"
	"wayland" "gdk-pixbuf2"
)
optdepends=(
	"rxvt-unicode: Default terminal emulator."
	"dmenu: Default for launching applications."
	"imagemagick: For taking screenshots."
	"ffmpeg: For recording screencasts."
	"i3status: To display system information with a bar."
)
arch=("i686" "x86_64")
url='http://swaywm.org'
source=("${pkgname%-*}::git+https://github.com/SirCmpwn/sway.git")
sha1sums=('SKIP')
provides=('sway')
conflicts=('sway')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"

	cmake . \
        -DCMAKE_BUILD_TYPE=Upstream \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	DESTDIR="$pkgdir/" make install
}

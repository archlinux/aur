# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=sway
pkgver=0.3
pkgrel=2
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SirCmpwn/sway/archive/${pkgver}.tar.gz")
sha512sums=('bf8c58227647240c2960916f95ff6ff873da51a5ef4e77e322de2cad7011d649d9a5141641b17a09efaa0a821ff621046b7b438a6ca1c9faa7ef206ed34b50f7')

build() {
	cd "${pkgname}-${pkgver}"

	cmake . \
        -DCMAKE_BUILD_TYPE=Upstream \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}

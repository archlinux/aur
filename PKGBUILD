# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=sway
pkgver=0.1
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
	"rxvt-unicode: Default terminal emulator."
	"dmenu: Default for launching applications."
	"imagemagick: For taking screenshots."
	"ffmpeg: For recording screencasts."
	"i3status: To display system information with a bar."
)
arch=("i686" "x86_64")
url='http://swaywm.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SirCmpwn/sway/archive/0.1.tar.gz")
sha512sums=('a1d29a98e6c4a771e42fe9b74952f0648deb7b4d41f4cd0daae582c8c29e4f2f2fb87d49ee9be88487ff5d36afc09ef2d8538c7b4bbf1ec40f9847080a131cb8')

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

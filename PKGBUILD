
pkgname=sway
pkgver=0.13.0
pkgrel=1
pkgdesc="i3 compatible window manager for Wayland"
arch=("i686" "x86_64")
url="http://swaywm.org"
license=("MIT")
backup=("etc/sway/security")
depends=(
	"wlc" "xorg-server-xwayland" "json-c" "pango" "wayland" "gdk-pixbuf2"
)
optdepends=(
	"rxvt-unicode: Default terminal emulator."
	"dmenu: Default for launching applications."
	"imagemagick: For taking screenshots."
	"ffmpeg: For recording screencasts."
	"i3status: To display system information with a bar."
)
makedepends=("cmake" "asciidoc")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/SirCmpwn/$pkgname/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz::https://github.com/SirCmpwn/$pkgname/archive/$pkgver.tar.gz.sig"
)
install="$pkgname.install"
sha256sums=(
	"56a20c9d28d92777bf99381edd09078f72bf39b8ac586242950d514456a77f7d"
	"SKIP"
)
validpgpkeys=(
	"9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A"
)


build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_SYSCONFDIR=/etc \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DVERSION="$pkgver"
	make
}

package() {
	cd build
	DESTDIR="$pkgdir" make install
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


pkgname=sway
pkgver=0.15.2
pkgrel=2
pkgdesc="i3 compatible window manager for Wayland"
arch=("x86_64")
url="http://swaywm.org"
license=("MIT")
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
	"05526e3038d2a5490a64bd816f1f04d2a6c214ddc6182835312b273b40b737ae"
	"SKIP"
)
validpgpkeys=(
	"9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A"
)


build() {
	mkdir -p build
	cd build
        export CFLAGS="-Wno-stringop-overflow -Wno-stringop-truncation $CFLAGS"
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

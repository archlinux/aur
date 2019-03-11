pkgname=sway
pkgver=1.0
pkgrel=1
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager"
arch=("x86_64")
url="https://swaywm.org/"
license=("MIT")
depends=(
	"cairo"
	"json-c"
	"pango"
	"pcre"
	"wlroots"
)
makedepends=("meson" "ninja" "scdoc" "wayland-protocols")
optdepends=(
	"dmenu: Default for launching applications."
	"ffmpeg: For recording screencasts."
	"gdk-pixbuf2: Required for swaybg."
	"i3status: To display system information with a bar."
	"imagemagick: For taking screenshots."
	"rxvt-unicode: Default terminal emulator."
)
validpgpkeys=("9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A") # Drew DeVault
install=$pkgname.install
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/swaywm/$pkgname/archive/$pkgver.tar.gz"
	"https://github.com/swaywm/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=(
	"24dafd0f1e630e97a5dd47233841adf856b665e2321d6207acfe6b3002d1bc56"
	"SKIP"
)

build() {
	cd "$pkgname-$pkgver"
	mkdir "build"
	cd "build"
	meson -Dwerror=false --prefix /usr ".."
	ninja
}

package() {
	DESTDIR="$pkgdir" ninja -C "$pkgname-$pkgver/build" install
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

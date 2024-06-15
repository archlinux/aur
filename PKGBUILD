# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.5
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots>=0.16')
makedepends=('wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
source=("https://codeberg.org/dwl/dwl/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz"
        config.h)
sha256sums=('1fa46962ff7493861cba1416dbee515502dabeacb98cdfdfd1019c2560f614b1'
            SKIP)

prepare() {
	cd "$srcdir/$pkgname-v$pkgver"
	# Use a custom config.h if the file is not empty
	if [ -s "$srcdir/config.h" ]; then
		cp -f "$srcdir/config.h" config.h
	fi
	# Uncomment to compile with XWayland support
	#sed -i -e '/-DXWAYLAND\|xcb/s/^#//' config.mk
}

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	make PREFIX="$pkgdir/usr/" install
}

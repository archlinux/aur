# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.7
pkgrel=2
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots0.18')
makedepends=('wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
source=("https://codeberg.org/dwl/dwl/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz"
        config.h)
sha256sums=('16e1412385f5fecaea997f734cb290f2bc412929da5b523c7c5180c6bd9402ea'
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

# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.3
pkgrel=2
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots>=0.15')
makedepends=('wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/djpohly/$pkgname/archive/v$pkgver.tar.gz"
        config.h)
sha256sums=('a3dd9b7107e9d324cc0dc4f48dd526fb687b10c9e63a42b33a827130d9113763'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# Use a custom config.h if the file is not empty
	if [ -s "$srcdir/config.h" ]; then
		cp -f "$srcdir/config.h" config.h
	fi
	# Uncomment to compile with XWayland support
	#sed -i -e '/-DXWAYLAND/s/^#//' config.mk
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/" install
}

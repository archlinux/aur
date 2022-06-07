# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots>=0.15')
makedepends=('wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/djpohly/$pkgname/archive/v$pkgver.tar.gz"
        config.h)
sha256sums=('5d550b0ee6d99d0b537269b8389af4b95d1ab0b63e7bb8c2309f6c57a2d6c9c9'
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

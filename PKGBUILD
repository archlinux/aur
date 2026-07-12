# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.8
pkgrel=2
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots0.19')
makedepends=('wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
source=("https://codeberg.org/dwl/dwl/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz"
        config.h)
sha256sums=('ccc8bbb3fb66a7e6f0392693533ac9c8bd4e6283dd1f66992e68ec4d4a9cdee7'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

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

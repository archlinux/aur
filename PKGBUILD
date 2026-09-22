# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.9
pkgrel=1
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots0.20')
makedepends=('wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
source=("https://codeberg.org/dwl/dwl/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz"
        config.h)
sha256sums=('51ed5da49942ca3272b6f2c4f1d7641b0b947a6eb1c264dce8a65b4d245596af'
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

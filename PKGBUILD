# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.4
pkgrel=2
pkgdesc="Simple, hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/djpohly/dwl"
license=('GPL')
depends=('wlroots>=0.16')
makedepends=('wayland-protocols')
optdepends=('xorg-xwayland: for XWayland support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/djpohly/$pkgname/archive/v$pkgver.tar.gz"
        config.h)
sha256sums=('f03a260b169019ebdbfd6db1b19a3dc7861ba33609644581c530be019f22274c'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# Use a custom config.h if the file is not empty
	if [ -s "$srcdir/config.h" ]; then
		cp -f "$srcdir/config.h" config.h
	fi
	# Uncomment to compile with XWayland support
	#sed -i -e '/-DXWAYLAND\|xcb/s/^#//' config.mk
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/" install
}

# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dwl
pkgver=0.2.2
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
sha256sums=('c629fa7f38050db9850dc0cdf487191c725e6fc68f0c497f6297b48e873c9e5e'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	cp "$srcdir/config.h" config.h
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

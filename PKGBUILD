# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=waynergy
pkgver=0.0.2
pkgrel=1
pkgdesc="Synergy client for wayland compositors"
arch=(x86_64)
url="https://github.com/r-c-f/waynergy"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libretls')
makedepends=(git meson ninja)
optdepends=('wl-clipboard: Clipboard synchronization support')
source=("https://github.com/r-c-f/waynergy/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('8b1142c95ae61373086a9abb6f5c23a9')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	arch-meson build
	cd build
	ninja
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}/build"
	DESTDIR="$pkgdir" ninja install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

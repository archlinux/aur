# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=waynergy
pkgver=0.0.12
pkgrel=1
pkgdesc="Synergy client for wayland compositors"
arch=(x86_64)
url="https://github.com/r-c-f/waynergy"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libretls')
makedepends=(git meson ninja)
optdepends=('wl-clipboard: Clipboard synchronization support')
source=("https://github.com/r-c-f/waynergy/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('3d7c1f43aa2bd591758b7f2d9ee0a44b')

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

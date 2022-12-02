# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=waynergy
pkgver=0.0.14
pkgrel=1
pkgdesc="Synergy client for wayland compositors"
arch=(x86_64)
url="https://github.com/r-c-f/waynergy"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libretls')
makedepends=(git meson ninja)
optdepends=(
	'wl-clipboard: Clipboard synchronization support'
	'gnome-session: Idle inhibition for GNOME'
)
source=("https://github.com/r-c-f/waynergy/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('4a5e2f84efdf078f22c3ab530a04e8ec')

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

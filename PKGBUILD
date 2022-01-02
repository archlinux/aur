# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=waynergy-git
pkgver=r176.aa06553
pkgrel=1
pkgdesc="Synergy client for wayland compositors"
arch=(x86_64 armv7h)
url="https://github.com/r-c-f/waynergy"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libretls')
makedepends=(git meson ninja)
optdepends=('wl-clipboard: Clipboard synchronization support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/r-c-f/waynergy.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson build
	cd build
	ninja
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	DESTDIR="$pkgdir" ninja install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

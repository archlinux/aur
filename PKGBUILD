# Maintainer: Ryan Farley <ryan.farley@gmx.com>

pkgname=waynergy-git
pkgver=r114.7f207eb
pkgrel=1
pkgdesc="Synergy client for wlroots wayland compositors"
arch=(x86_64)
url="https://github.com/r-c-f/waynergy"
license=('MIT')
depends=('libxkbcommon' 'wayland')
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

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=wayqt-git
_pkg="${pkgname%-git}"
pkgver=r34.c296e49
pkgrel=1
pkgdesc='Qt-based wrapper for various Wayland protocols'
arch=('x86_64')
url='https://gitlab.com/desktop-frameworks/wayqt'
license=('MIT')
depends=('qt5-base' 'qt5-wayland' 'wayland' 'wayland-protocols' 'wlroots')
makedepends=('git' 'meson')
provides=("$_pkg" 'libwayqt.so')
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$_pkg" build
	meson compile -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
	install -Dm644 "$_pkg/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

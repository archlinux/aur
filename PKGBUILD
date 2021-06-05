
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>
# Contributor: Daurnimator <daurnimator@archlinux.org>

pkgname=river-git
_pkgname=${pkgname%-*}
pkgver=r623.0e9dc08
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/ifreund/river'
license=('GPL3')
depends=(
	'zig>=0.8.0' 'mesa>=21.1.2' 'wayland' 'wayland-protocols' 'wlroots'
	'libxkbcommon' 'libevdev' 'pixman' 'xorg-xwayland' 'scdoc'
)
provides=('river' 'riverctl' 'rivertile')
conflicts=('river')
source=("git+$url")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	git submodule update --init
}

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" zig build install -Drelease-safe -Dxwayland \
		--prefix '/usr'
}

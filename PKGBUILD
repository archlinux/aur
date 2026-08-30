# Maintainer: uncognic <92607100+uncognic@users.noreply.github.com>

pkgname=steppewm
pkgver=0.3.3
pkgrel=1
pkgdesc='Minimal stacking Wayland compositor using wlroots'
arch=('x86_64' 'aarch64')
url='https://github.com/uncognic/steppewm'
license=('GPL-3.0-or-later')
depends=(
	'cairo'
	'glib2'
	'glibc'
	'libgcc'
	'libinput'
	'libpulse'
	'librsvg'
	'libstdc++'
	'libxkbcommon'
	'lua54'
	'sdbus-cpp'
	'wayland'
	'wlroots0.20'
)
makedepends=(
	'meson'
	'ninja'
	'pixman'
	'pkgconf'
	'wayland-protocols'
)
optdepends=(
	'xwayland-satellite: XWayland support'
	'swaybg: wallpaper'
	'swayidle: idle management'
	'wlr-randr: output configuration'
	'wlopm: output power management'
	'wlrctl: window and input control from the shell'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('162692a235ac41128043995a9bb3d6cb44a9a679c6c8000083eca473e1e8b9d951cd379c59a5374267481df3d517ec7e9cfa2abe491ca6d819403f2bb9d2c7db')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "$pkgname-$pkgver/config.lua" \
		"$pkgdir/usr/share/doc/$pkgname/config.lua"
	install -Dm644 "$pkgname-$pkgver/doc/steppewm.md" \
		"$pkgdir/usr/share/doc/$pkgname/steppewm.md"
	install -Dm644 "$pkgname-$pkgver/README.md" \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
}

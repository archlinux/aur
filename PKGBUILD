# Maintainer: uncognic <92607100+uncognic@users.noreply.github.com>

pkgname=steppewm
pkgver=0.3.2
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
b2sums=('034c8e7def2cc49e2d7748a095e36d97874508cfd553bb109b4a707cefdb355c662251fbee090bfdb2d5a7c86257823013a888edb0d73c808b6a16da9be5c4c1')

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

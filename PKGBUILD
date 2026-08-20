# Maintainer: uncognic <92607100+uncognic@users.noreply.github.com>

pkgname=steppewm
pkgver=0.3.0
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
b2sums=('186d96f1d5ca0e4152e4b1077c1a10a7fce3f8f1565830a7cc187cb7e40389b9024d2f49f2acbe6267ac147e062f236528341ce95553f5e5b4ff4a74cf0f5522')

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

# Maintainer: uncognic <92607100+uncognic@users.noreply.github.com>

pkgname=steppewm-git
_pkgname=steppewm
pkgver=r1.0000000
pkgrel=1
pkgdesc='Minimal stacking Wayland compositor using wlroots (git)'
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
	'git'
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
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$_pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "$_pkgname/config.lua" \
		"$pkgdir/usr/share/doc/$_pkgname/config.lua"
	install -Dm644 "$_pkgname/doc/steppewm.md" \
		"$pkgdir/usr/share/doc/$_pkgname/steppewm.md"
	install -Dm644 "$_pkgname/README.md" \
		"$pkgdir/usr/share/doc/$_pkgname/README.md"
}

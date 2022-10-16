# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vivarium-git
_pkg="${pkgname%-git}"
pkgver=0.0.4.r24.g40b1038
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor inspired by xmonad"
arch=('x86_64')
url="https://github.com/inclement/vivarium"
license=('GPL3')
depends=('wlroots' 'xcb-util-renderutil')
makedepends=('git' 'meson' 'wayland-protocols' 'cpptoml')
optdepends=('xorg-xwayland: X.org support under Wayland'
            'waybar: Bar program for Wayland; the only tested one')
provides=("$_pkg")
conflicts=("$_pkg")
backup=("etc/$_pkg/config.toml")
install="$pkgname.install"
source=("$_pkg::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	meson --prefix=/usr --buildtype=release -Ddevelop=false -Dwerror=false "$_pkg" build
	meson compile -C build
}

# check() {
# 	meson test -C build
# }

package() {
	DESTDIR="$pkgdir" meson install -C build
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vivarium-git
_pkg="${pkgname%-git}"
pkgver=0.0.4.r30.g1ffa436
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor inspired by xmonad"
arch=('x86_64')
url="https://github.com/inclement/vivarium"
license=('GPL3')
depends=('wlroots0.15' 'xcb-util-renderutil')
makedepends=('git' 'meson' 'wayland-protocols' 'cpptoml')
optdepends=('xorg-xwayland: X.org support under Wayland'
            'waybar: Bar program for Wayland; the only tested one')
provides=("$_pkg")
conflicts=("$_pkg")
backup=("etc/$_pkg/config.toml")
install="$pkgname.install"
source=("$_pkg::git+$url")
md5sums=('SKIP')

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

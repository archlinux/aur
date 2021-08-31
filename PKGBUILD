# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vivarium-git
pkgver=0.0.4.r3.gd7074de
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor inspired by xmonad"
arch=('x86_64')
url="https://github.com/inclement/vivarium"
license=('GPL3')
depends=('wlroots>=0.14.0' 'wlroots<0.15.0' 'xcb-util-renderutil')
makedepends=('git' 'meson' 'wayland-protocols')
optdepends=(
	'xorg-xwayland: X.org support under Wayland'
	'waybar: Bar program for Wayland; the only tested one')
provides=('vivarium')
conflicts=('vivarium')
backup=('etc/vivarium/config.toml')
install="$pkgname.install"
source=("git+$url?signed")
md5sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')

pkgver() {
	git -C vivarium describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	meson --prefix=/usr --buildtype=release -Ddevelop=false -Dwerror=false vivarium build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

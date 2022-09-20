# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Librewish <librewish@gmail.com?
# Contributer: Dan Johansen <strit@manjaro.org>

pkgname=greetd-qtgreet-git
_pkg="${pkgname%-git}"
pkgver=1.0.0.r30.g04e0160
pkgrel=1
pkgdesc='Qt based greeter for greetd'
arch=('aarch64' 'x86_64')
url="https://gitlab.com/marcusbritanicus/QtGreet"
license=('GPL3')
depends=('greetd' 'json-c' 'qt5-base' 'qt5-wayland' 'wayqt' 'wlroots')
makedepends=('git' 'meson')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

## no im not using that setup.py script

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	arch-meson "$_pkg" build
	meson compile -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
}

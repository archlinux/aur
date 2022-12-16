#Maintainer: Frederic Bezies <fredbezies at gmail dot com>
#Contributor: Mike Swanson

pkgname=woof-git
pkgver=10.4.0.r101.4ac06135
pkgrel=1
pkgdesc="Doom port remaining faithful to Lee Killough’s MBF on DOS"
arch=("x86_64")
url="https://github.com/fabiangreffrath/woof"
license=('GPL2')
depends=('hicolor-icon-theme' 'sdl2_net' 'sdl2_mixer')
makedepends=('cmake' 'git' 'python')
conflicts=('woof-doom')
source=(woof::git+"${url}".git)
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/^woof_//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	mkdir -p "$srcdir/${pkgname%-git}-build"
	cd "$srcdir/${pkgname%-git}-build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}-build"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}-build"
	make DESTDIR="$pkgdir/" install
}

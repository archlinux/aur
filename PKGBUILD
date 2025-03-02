#Maintainer: Frederic Bezies <fredbezies at gmail dot com>
#Contributor: Mike Swanson

pkgname=woof-doom-git
_pkgname=woof
pkgver=15.2.0.r31.4681e5ae
pkgrel=1
pkgdesc="Doom port remaining faithful to Lee Killough’s MBF on DOS"
arch=("x86_64")
url="https://github.com/fabiangreffrath/woof"
license=('GPL-2.0-or-later')
depends=('hicolor-icon-theme' 'sdl2_net' 'openal' 'libsndfile' 'libebur128' 'cjson')
makedepends=('cmake' 'git' 'python')
optdepends=('fluidsynth' 'libxmp')
conflicts=('woof-doom')
source=(woof::git+"${url}".git)
sha512sums=('SKIP')
options=(!debug)

pkgver() {
	cd "$srcdir/${_pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/^woof_//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	mkdir -p "$srcdir/${_pkgname%-git}-build"
	cd "$srcdir/${_pkgname%-git}-build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/${_pkgname%-git}"
}

build() {
	cd "$srcdir/${_pkgname%-git}-build"
	make
}

package() {
	cd "$srcdir/${_pkgname%-git}-build"
	make DESTDIR="$pkgdir/" install
}

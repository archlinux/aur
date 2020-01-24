pkgname=woof-git
pkgver=0.9.0.r11.27f21ed
pkgrel=1
pkgdesc="Doom port remaining faithful to Lee Killough’s MBF on DOS"
arch=("x86_64")
url="https://github.com/fabiangreffrath/woof"
license=('GPL2')
depends=('hicolor-icon-theme' 'sdl2' 'sdl2_net' 'sdl2_mixer')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(woof::git+"${url}".git)
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --tags --long | sed 's/^woof_//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	autoreconf -fi
}

build() {
	cd "$srcdir/${pkgname%-git}"

	./configure --prefix=/usr
	make V=0
}

package() {
	cd "$srcdir/${pkgname%-git}"

	make DESTDIR="$pkgdir/" install
}

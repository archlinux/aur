pkgname=winmbf-git
pkgver=r96.8bdbefc
pkgrel=1
pkgdesc="Doom port remaining faithful to Lee Killough’s MBF on DOS"
arch=("x86_64")
url="https://github.com/fabiangreffrath/WinMBF"
license=('GPL2')
depends=('sdl2' 'sdl2_net' 'sdl2_mixer')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(winmbf::git+"${url}".git)
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

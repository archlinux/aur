# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=mrsh-git
pkgver=r314.e73e175
pkgrel=1
pkgdesc="A minimal POSIX shell"
url="https://git.sr.ht/~emersion/mrsh"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=("meson" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson --prefix /usr "$srcdir/build"
	ninja -C "$srcdir/build"
}

check() {
	ninja -C "$srcdir/build" test
}

package() {
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}

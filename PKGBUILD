# Maintainer: Mark Wells mwellsa at gmail dot com
pkgname="screenfetch-c-git"
pkgver=1.6.0.r4.gf14a1bf
pkgrel=1
pkgdesc="A rewrite of screenFetch in C"
arch=('any')
url="https://github.com/woodruffw/screenfetch-c"
license=('MIT')
groups=()
depends=('bash' 'libglvnd')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	# sed -i 's/PREFIX = /PREFIX = $(DESTDIR)/g' Makefile
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr" install
}

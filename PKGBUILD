# Maintainer: Kian Kasad <kian@kasad.com>

pkgname=kirc-git
pkgver=0.1.8.r0.8022754
pkgrel=1
pkgdesc="KISS for IRC, an IRC client written in POSIX C99"
arch=(any)
url="https://github.com/mcpcpc/kirc"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -TDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

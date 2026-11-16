# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Kian Kasad <kian@kasad.com>

pkgname=kirc-git
pkgver=1.2.2.r0.5f3b746
pkgrel=1
pkgdesc="KISS for IRC, an IRC client written in POSIX C99"
arch=('x86_64')
url="https://github.com/mcpcpc/kirc"
license=('MIT')
depends=('glibc')
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


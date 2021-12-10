# Maintainer: Kian Kasad <kian at kasad.com>
pkgname=s6-man-pages-git
pkgver=v2.11.0.0.4.r0.efea5f8
pkgrel=1
pkgdesc='Manual pages for the s6 suite of software'
arch=('any')
url='https://github.com/flexibeast/s6-man-pages'
license=('ISC')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d -m 0755 $pkgdir/usr/share/man/man{7,8}
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

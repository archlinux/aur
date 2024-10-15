# Maintainer: Lazerbeak12345 <lazerbeak12345 at users dot noreply dot github dot com>
# Contributor: Kian Kasad <kian at kasad.com>
pkgname=execline-man-pages-git
pkgver=v2.9.6.1.1.r0.0c6377e
pkgrel=1
pkgdesc='Manual pages for the execline suite of software'
arch=('any')
url='https://git.sr.ht/~flexibeast/execline-man-pages'
license=('ISC')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d -m 0755 "$pkgdir/usr/share/man/man{1,7}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

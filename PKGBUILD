# Maintainer: Kian Kasad <kian at kasad.com>
pkgname=execline-man-pages-git
pkgver=v2.8.0.0.1.r0.7fce6a4
pkgrel=1
pkgdesc='Manual pages for the execline suite of software'
arch=('any')
url='https://github.com/flexibeast/execline-man-pages'
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

package() {
	cd "$srcdir/${pkgname%-git}"
	make MANPATH="$pkgdir/usr/share/man" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

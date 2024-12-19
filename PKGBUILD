# Maintainer: Meriel Luna Mittelbach <lunarlambda@gmail.com>
pkgname=blaustahl-git
pkgver=r35.4c1ae04
pkgrel=1
pkgdesc="blaustahl utility"
arch=('x86_64')
url="https://github.com/machdyne/blaustahl"
license=('MIT')
depends=('libusb>=1' 'libusb<2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!debug)
source=('git+https://github.com/machdyne/blaustahl')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make -C sw
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D sw/bs "$pkgdir/usr/bin/blaustahl"
	install -Dm644 README.md "$pkgdir/usr/share/doc/blaustahl/README.md"
}

# Maintainer: Fabian Piribauer <fabian.piribauer@gmail.com>
pkgname=iburg-git
pkgver=2151dd7
pkgrel=1
pkgdesc="A Tree Parser Generator"
arch=('any')
url="https://github.com/drh/iburg"
license=('MIT')
source=("$pkgname::git+https://github.com/drh/iburg.git")
sha256sums=('SKIP')


pkgver() {
	cd "$pkgname"
	git describe --always | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	gzip iburg.1
	install -Dm644 iburg.1.gz "$pkgdir/usr/share/man/man1/iburg.1.gz"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 iburg "$pkgdir/usr/bin/iburg"
}

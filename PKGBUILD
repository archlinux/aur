# Maintainer: Thomas Voss <mail@thomasvoss.com>
pkgname=center-git
pkgver=r35.eb1da76
pkgrel=1
pkgdesc="Center text to standard output"
arch=('x86_64' 'i686')
url="https://git.thomasvoss.com/center"
license=('BSD')
makedepends=('git')
source=("$pkgname::git://git.thomasvoss.com/center.git")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" \
		"`git rev-list --count HEAD`" \
		"`git rev-parse --short HEAD`"
}

build() {
	cd $pkgname
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

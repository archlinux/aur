# Maintainer: Thomas Voss <mail@thomasvoss.com>
pkgname=center
pkgver=1.3.0
pkgrel=1
pkgdesc="Center text to standard output"
arch=('x86_64' 'i686')
url="https://git.thomasvoss.com/center"
license=('BSD')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+git://git.thomasvoss.com/center.git#tag=v$pkgver")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags --long | sed 's/^v//; s/-.*//'
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

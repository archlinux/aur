# Maintainer: Thomas Voss <mail@thomasvoss.com>
pkgname=liblux
pkgver=1.0.3
pkgrel=1
pkgdesc="C library to interact with backlight brightness"
arch=('x86_64' 'i686')
url="https://git.thomasvoss.com/liblux"
license=('BSD')
makedepends=('git' 'tup-git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+git://git.thomasvoss.com/liblux.git#tag=v$pkgver")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags --long | sed 's/^v//; s/-.*//'
}

build() {
	cd $pkgname
	tup
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

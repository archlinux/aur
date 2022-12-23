# Maintainer: Thomas Voss <mail@thomasvoss.com>
pkgname=clux
pkgver=1.0.1
pkgrel=1
pkgdesc="Command-line utility to interact with screen brightness"
arch=('x86_64' 'i686')
url="https://git.thomasvoss.com/lux"
license=('BSD')
depends=('liblux')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+git://git.thomasvoss.com/lux.git#tag=v$pkgver")
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
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

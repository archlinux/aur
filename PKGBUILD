# Maintainer: Thomas Voss <mail@thomasvoss.com>
pkgname=clux-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Command-line utility to interact with screen brightness"
arch=('x86_64' 'i686')
url="https://git.thomasvoss.com/lux"
license=('BSD')
depends=('liblux')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git://git.thomasvoss.com/lux.git")
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	printf "%s" "`git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;y/-/./'`"
}

build() {
	cd ${pkgname%-git}
	make
}

package() {
	cd ${pkgname%-git}
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}

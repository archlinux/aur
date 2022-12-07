# Maintainer: Thomas Voss <mail@thomasvoss.com>
pkgname=center-git
pkgver=1.3.0.r3.f6c80cb
pkgrel=1
pkgdesc="Center text to standard output"
arch=('x86_64' 'i686')
url="https://git.thomasvoss.com/center"
license=('BSD')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git://git.thomasvoss.com/center.git")
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
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}

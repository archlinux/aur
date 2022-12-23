# Maintainer: Thomas Voss <mail@thomasvoss.com>
pkgname=liblux-git
pkgver=1.0.2.r2.a08cbea
pkgrel=1
pkgdesc="C library to interact with backlight brightness"
arch=('x86_64' 'i686')
url="https://git.thomasvoss.com/liblux"
license=('BSD')
makedepends=('git' 'tup-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git://git.thomasvoss.com/liblux.git")
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	printf "%s" "`git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;y/-/./'`"
}

build() {
	cd ${pkgname%-git}
	tup
}

package() {
	cd ${pkgname%-git}
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}

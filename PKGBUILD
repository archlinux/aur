# Maintainer: emersion <contact emersion fr>
pkgname=libvarlink
pkgver=19
pkgrel=1
license=('MIT')
pkgdesc='Varlink C library and command line tool'
makedepends=("meson" "python")
arch=('x86_64')
url='https://github.com/varlink/libvarlink'
source=("https://github.com/varlink/libvarlink/archive/${pkgver}.tar.gz")
sha256sums=('0e316138ef6abc34363b05d0caf6df2e389a93b832e8d971e3ae64b48ba96133')

build() {
	cd "$pkgname-$pkgver"

	meson --prefix=/usr build/
	ninja -C build/
}

check() {
	cd "$pkgname-$pkgver"
	ninja -C build/ test
}

package() {
	cd "$pkgname-$pkgver"

	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

	DESTDIR="$pkgdir/" ninja -C build/ install
}

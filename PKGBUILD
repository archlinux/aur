# Maintainer: emersion <contact emersion fr>
pkgname=libvarlink
pkgver=16
pkgrel=1
license=('MIT')
pkgdesc='Varlink C library and command line tool'
makedepends=("meson" "python")
arch=('x86_64')
url='https://github.com/varlink/libvarlink'
source=("https://github.com/varlink/libvarlink/archive/${pkgver}.tar.gz")
sha256sums=('3857f109574750403b233b5fdf73f1852d8decc33dac8f73bd49f2003b69ad22')

build() {
	cd "$pkgname-$pkgver"

	meson --prefix=/usr build/
	ninja -C build/
}

package() {
	cd "$pkgname-$pkgver"

	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

	DESTDIR="$pkgdir/" ninja -C build/ install
}

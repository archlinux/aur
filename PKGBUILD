# Maintainer: emersion <contact emersion fr>
pkgname=libvarlink
pkgver=18
pkgrel=1
license=('MIT')
pkgdesc='Varlink C library and command line tool'
makedepends=("meson" "python")
arch=('x86_64')
url='https://github.com/varlink/libvarlink'
source=("https://github.com/varlink/libvarlink/archive/${pkgver}.tar.gz")
sha256sums=('7a32543643116ad105da4ddb2f8030de7dcad1cdb3feb1a214ae5e7b65a6a198')

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

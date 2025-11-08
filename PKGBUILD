# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=libleidenalg
pkgver=0.12.0
pkgrel=1
pkgdesc='Leiden algorithm'
arch=(i686 x86_64)
url='https://github.com/vtraag/libleidenalg'
depends=(igraph)
makedepends=(cmake)
license=(GPL-3.0-or-later)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b9d27b99586ba9b1f44d1899e94990e66ff4bf740086c4aed321590c1d4bf808')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p build
	echo "$pkgver" > VERSION
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	(cd build; make install)
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

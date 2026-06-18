# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=libleidenalg
pkgver=0.13.0
pkgrel=1
pkgdesc='Leiden algorithm'
arch=(i686 x86_64)
url='https://github.com/vtraag/libleidenalg'
depends=(igraph)
makedepends=(cmake)
license=(GPL-3.0-or-later)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('134e33bf68222b301cf5fbe93b5a8af222f2910caac34b85e33afac6e9365d2a')

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

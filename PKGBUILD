pkgname=lrzip-next
pkgver=0.13.1
pkgrel=1
pkgdesc="Next generation multi-threaded compression with rzip"
arch=('x86_64')
url="https://github.com/pete4abw/lrzip-next"
license=('GPL-2.0-or-later')
depends=(bzip2 bzip3 libgcrypt lz4 lzo zlib zstd)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f31becc3fb9e332a9682d41d2c6408bf08ee9173ddf7794259d1a5c7ea13b2a6d41f66c6ed9c88f840a48845f99d47526dd64667a788aefef5cea630bce4a094')

prepare() {
	cd "$pkgname-$pkgver"

	env NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}

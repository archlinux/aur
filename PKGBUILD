pkgname=lrzip-next
pkgver=0.14.1
pkgrel=1
pkgdesc="Next generation multi-threaded compression with rzip"
arch=('x86_64')
url="https://github.com/pete4abw/lrzip-next"
license=('GPL-2.0-or-later')
depends=(bzip2 bzip3 libgcrypt lz4 lzo zlib zstd)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7afdd868e4cacf33797aa8c535b52b16cd448dfa7d57f017c22bdaab7c22cddd3d0604ca4e400a6dd09cbec1c8b77993fb49bfb321a19b9823ab2dda824b654d')

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

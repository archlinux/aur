# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=ugrep-indexer
pkgver=0.9.6
pkgrel=1
pkgdesc="A monotonic indexer to speed up grepping by >10x (for ugrep)"
arch=('x86_64')
url="https://github.com/Genivia/ugrep-indexer"
license=('BSD-3-Clause')
depends=('zlib' 'lz4' 'brotli' 'xz' 'glibc' 'zstd' 'bzip2' 'gcc-libs')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8084a9ea34321b4062b978c2e1f1d9e1ee6430e83728c3f4bc0cbe91216201a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=ugrep-indexer
pkgver=1.0.0
pkgrel=1
pkgdesc="A monotonic indexer to speed up grepping by >10x (for ugrep)"
arch=('x86_64')
url="https://github.com/Genivia/ugrep-indexer"
license=('BSD')
depends=('zlib' 'lz4' 'brotli' 'xz' 'glibc' 'zstd' 'bzip2' 'gcc-libs')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e607bbb2c5c2e92284c19f36398926f4a6ba69ab7c24fc2906c099f06b0f001d')

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

# Maintainer: Dennis Wölfing <denniswoelfing at gmx dot de>

pkgname=dxcompress
pkgver=1.1
pkgrel=1
pkgdesc="Compression and decompression utility"
arch=('x86_64')
url="https://github.com/dennis95/dxcompress"
license=('ISC')
depends=('xz' 'zlib')
# The gzip packages provides uncompress and zcat utilities conflicting with the
# dxcompress implementation. Luckily dxcompress can provide gzip
provides=('gzip' 'ncompress')
conflicts=('gzip' 'ncompress')
source=("https://github.com/dennis95/dxcompress/releases/download/dxcompress-$pkgver/dxcompress-$pkgver.tar.xz")
sha256sums=('89c1331a860467a58e0c69e54238fb29c7bdeb436672009efd61964fb6840dc6')

build() {
	cd "dxcompress-$pkgver"
	./configure --prefix=/usr --enable-wrappers=gzip
	make
}

check() {
	cd "dxcompress-$pkgver"
	make check
}

package() {
	cd "dxcompress-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

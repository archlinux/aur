# Maintainer: Dennis Wölfing <denniswoelfing at gmx dot de>

pkgname=dxcompress
pkgver=1.0
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
sha256sums=('28ef275fff1ac2c126cd5bc3d7319038266274db8efe6bdc1f33ba6d5e235f4e')

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

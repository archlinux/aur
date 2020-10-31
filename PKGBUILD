# Maintainer: Dennis Wölfing <denniswoelfing at gmx dot de>

pkgname=dxcompress-git
pkgver=1.0.r0.g65946d5
pkgrel=1
pkgdesc="Compression and decompression utility"
arch=('x86_64')
url="https://github.com/dennis95/dxcompress"
license=('ISC')
depends=('xz' 'zlib')
makedepends=('git')
# The gzip packages provides uncompress and zcat utilities conflicting with the
# dxcompress implementation. Luckily dxcompress can provide gzip
provides=('dxcompress' 'gzip' 'ncompress')
conflicts=('dxcompress' 'gzip' 'ncompress')
source=('git+https://github.com/dennis95/dxcompress')
sha256sums=('SKIP')

pkgver() {
	cd dxcompress
	git describe --long | sed 's/^dxcompress-//;s/-/.r/;s/-/./'
}

build() {
	cd dxcompress
	./autogen.sh
	./configure --prefix=/usr --enable-wrappers=gzip
	make
}

check() {
	cd dxcompress
	make check
}

package() {
	cd dxcompress
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

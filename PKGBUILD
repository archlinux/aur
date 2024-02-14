# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='libbsctools'
pkgdesc='Common library used by some BSC tools such as folding (from BSC).'
pkgver='1.0.6.20240214'
pkgrel='2'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(8f2abf43750b557d94ad58546210ace29f145ecbc817864d1a82a7b71e040a0d0f63ba742fc8bccff3047f6211019cddb2ea24edaa35fe0a7e05e9ba6815a58a)

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	./configure \
		--prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: Often fails with parallel install, so force make to run sequentially
	DESTDIR="$pkgdir" make install -j1
}

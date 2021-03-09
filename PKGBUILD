# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='dimemas'
pkgdesc='High-abstracted network simulator for message-passing programs (from BSC).'
pkgver='5.4.2.20210309'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "dimemas-Build-fix-for-GCC-10-fno-common-default.patch")
sha512sums=(bc7ad49f84efca65278e215ea4b1601b303bfb0f3d37e823977f853998050f0faa211108b87340210d8d0ccfb3bb4b8fec50a3f373dbacf7d24251a200a3573e
            94b11bec6ee99fc9327a0f392d021289a1a5bb2150f2354a4403002fafe3263e18c7bfed8eee97fe26280813a84820565e5b0969b8dedf05c3852e2ab2634547)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	patch -Np1 -i "$srcdir/dimemas-Build-fix-for-GCC-10-fno-common-default.patch"
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# NOTE: The following optional features are NOT enabled:
	# * Java GUI
	./configure \
		--prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install
}
# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='dimemas'
pkgdesc='High-abstracted network simulator for message-passing programs (from BSC).'
pkgver='5.4.2.20200414'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "dimemas-Build-fix-for-GCC-10-fno-common-default.patch")
sha512sums=(b2a1b63a079bc1a32074759debf1af232fb804081af3581de1c1739775117b49413bcca1cdee534c890786cea22430f04525d456e26b4505f92aad726b7e4138
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
# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='libbsctools'
pkgdesc='Common library used by some BSC tools such as folding (from BSC).'
pkgver='1.0.5.20180531'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(3ec334755b860a521fa7fc0524f495efc6574bcabef4aa69021212b1b9c2b918ccac54abda846a83e86e6db8ca2726b8abc83d3228aa05637348b17b0e90287a)

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	./configure \
		--prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: Often fails with parallel install, so force make to run sequentially
	# WORKAROUND: Specifying the install directory using DESTDIR does not work
	make prefix="$pkgdir/usr/" install -j1
}
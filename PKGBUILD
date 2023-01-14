# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='libbsctools'
pkgdesc='Common library used by some BSC tools such as folding (from BSC).'
pkgver='1.0.6.20230111'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(547f3a3978772e5aa20762b66478392cebdb58a005714cdeae4431a3a6466d893d3bf72a958cd1438b151fd0db61d7f9b82c4387dbd7b1d20186cee388533e1f)

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

# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='libbsctools'
pkgdesc='Common library used by some BSC tools such as folding (from BSC).'
pkgver='1.0.6.20240503'
pkgrel='2'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(bce756ff2e1c6eec04307cac72e824baaa6587b67d4f24f99bfa143ca17a6e3e82424e452139440d711175ac323b3e7103b067cec8d20465cb6b9180ac0e62e1)

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

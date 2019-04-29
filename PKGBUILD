# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='tracking'
pkgdesc='Analyze how the behavior of a parallel application evolves through different scenarios (from BSC).'
pkgver='2.6.10'
pkgrel='4'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('GPL2')
depends=(wxparaver clusteringsuite python-pillow python-wxpython python-matplotlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2"
        python3-ports.patch)
sha512sums=(577783edf85f9a53fdabc8a25556fca806c8a9c3df28d713815fc5cccb63450bf3a5d0ee904bec4e7b125f3278d75e6c2b9c2e899f14ab4694d288b07db3eb9d
            78568513919ee9d5e2c1c2a9f835259d097b2bbd246fc911b4c2083d4e2a9e20c86a15e990997b41dd5e62bb04d3c156c2aa47ad90d6d3fc55eca1040fc97ed9)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# WORKAROUND: Fix some scripts that still only work with Python 2
	patch -Np1 -i "$srcdir/python3-ports.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure \
		--prefix=/usr \
		--with-paraver=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# WORKAROUND: Specifying the install directory using DESTDIR does not work
	make prefix="$pkgdir/usr/" install
}

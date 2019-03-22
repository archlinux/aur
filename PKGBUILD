# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='tracking'
pkgdesc='Analyze how the behavior of a parallel application evolves through different scenarios (from BSC).'
pkgver='2.6.10'
pkgrel='3'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('GPL2')
depends=(wxparaver clusteringsuite python-pillow python-wxpython python-matplotlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(577783edf85f9a53fdabc8a25556fca806c8a9c3df28d713815fc5cccb63450bf3a5d0ee904bec4e7b125f3278d75e6c2b9c2e899f14ab4694d288b07db3eb9d)

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

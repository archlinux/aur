# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='tracking'
pkgdesc='Analyze how the behavior of a parallel application evolves through different scenarios (from BSC).'
pkgver='2.7.1.20250303'
pkgrel='2'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
# Upstream does not say whether later versions of LGPL are acceptable, so I am assuming they are
# (See the "If the Library does not specify a license version number" LGPL license clause)
license=('LGPL-2.1-or-later')
depends=(wxparaver clusteringsuite python-pillow python-wxpython python-matplotlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=('058b4c81b95a614e05c90ea1fccc57a974954f1127bb6e9e295d77c62962226384ad96c20712e2945a98b1bd58c6aeee7ecf01c7dbac0615a0cbcd3ece9d64f8')

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	./configure \
		--prefix=/usr \
		--with-paraver=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: Specifying the install directory using DESTDIR does not work
	make prefix="$pkgdir/usr/" install
}

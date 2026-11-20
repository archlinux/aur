# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='tracking'
pkgdesc='Analyze how the behavior of a parallel application evolves through different scenarios (from BSC).'
pkgver='26.11.0.20261119'
pkgrel='1'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
# Upstream does not say whether later versions of LGPL are acceptable, so I am assuming they are
# (See the "If the Library does not specify a license version number" LGPL license clause)
license=('LGPL-2.1-or-later')
depends=(wxparaver clusteringsuite python-pillow python-wxpython python-matplotlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=('2d24c2c0d080ec35c1a404c1c01745ed15f8458f95a47b8cc6dc6e5408ca98b91db9a6d06ea2f335dc21a7f9d44877546ae6937ecb744131d3de58e0670a3bc9')

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

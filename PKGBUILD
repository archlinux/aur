# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='tracking'
pkgdesc='Analyze how the behavior of a parallel application evolves through different scenarios (from BSC).'
pkgver='2.7.1.20240509'
pkgrel='1'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
# Upstream does not say whether later versions of LGPL are acceptable, so I am assuming they are not
license=('LGPL-2.1-only')
depends=(wxparaver clusteringsuite python-pillow python-wxpython python-matplotlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=('a20a3c99e61cd1acd047114ec75e1d0f3034fb5be947d6dc6baa4b4c7e5b4fc8a91d4ec3219608247eb3260608ab6a3c084871278e1f4326829a47d180817e2d')

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

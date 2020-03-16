# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='tracking'
pkgdesc='Analyze how the behavior of a parallel application evolves through different scenarios (from BSC).'
pkgver='2.6.11.20200316'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('GPL2')
depends=(wxparaver clusteringsuite python-pillow python-wxpython python-matplotlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        python3-ports.patch)
sha512sums=(9a9e4bda1d179511aa28bd9e08a8c7a61d6b54a1f392e948514926f54ddd35d7db4f4f39f0c0420cb016e7ff3a016785305a0a0aad4d35ace0ec8ceb129a2911
            127d7a1989284ebfd8911090ce01e38fad7dbb12ceb307e73a6fb54dff09f9e0c99410376dce4a8e1e4308dc5c44e25218c929df6151b674b31a06e4e1075bfe)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: Fix some scripts that still only work with Python 2
	patch -Np1 -i "$srcdir/python3-ports.patch"
}

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

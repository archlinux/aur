# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='3.7.0'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(openmpi libunwind papi libxml2 zlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(59e886c41f699f58932c22d17511fb1a9540f814689695b03e959896399a9a9d951d0c44adc3b41612b20bb071a0572f27f4cf2d23e11cbcf7f466225b5c353a)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# NOTE: The following optional features are NOT enabled:
	# * Automatic instrumentation (with dyninst)
	# * CUDA support
	# * OpenCL support
	# * LaTeX documentation
	./configure \
		--prefix=/usr \
		--with-mpi=/usr \
		--with-mpi-libs=/usr/lib/openmpi \
		--with-mpi-headers=/usr/include/openmpi \
		--with-unwind=/usr \
		--with-unwind-headers=/usr/include \
		--with-unwind-libs=/usr/lib \
		--with-papi=/usr \
		--with-papi-headers=/usr/include \
		--with-papi-libs=/usr/lib \
		--without-dyninst

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
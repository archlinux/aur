# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='3.6.1'
pkgrel='3'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPLv2.1')
depends=(openmpi libunwind papi libxml2 zlib)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(e88435364c31e6de051965a2f23c49be8fdb2afe7542a962c23a35ced3520cfdec308823c4a28f8276ee30eab34708d7e4e7ee8f412740a37e1252d85ea8b356)

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
		--with-unwind=/usr \
		--with-papi=/usr \
		--without-dyninst

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
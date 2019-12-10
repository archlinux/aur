# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='spectral'
pkgdesc='Signal processing techniques to select representative regions from Paraver traces (from BSC).'
pkgver='3.4.1.20180918'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('GPL3')
depends=(fftw libbsctools extrae)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(5b6350cbc6800857d1eeec7b6061406e3d238c12078f90a1ab611f89865f4bf07ef01dd638d9f258e64dfeded3963bdb48fba142599c29b57ffbcb7a86ac72f4)

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	./configure \
		--prefix=/usr \
		--with-fft=/usr \
		--with-extrae=/usr \
		--with-libbsctools=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install
}
# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=tucnak3
pkgver=3.28
pkgrel=1
pkgdesc="Ham Radio - VHF/HF contest logbook"
arch=('i686' 'x86_64')
url="http://tucnak.nagano.cz/"
license=('GPL')
depends=('libzia3' 'fftw' 'libftdi-compat' 'portaudio' 'hamlib' 'gpm' 'desktop-file-utils')
makedepends=('pkg-config')
install=$pkgname.install
source=("http://tucnak.nagano.cz/tucnak3-3.28.tar.gz"
	diff.misc.c
	diff.subwin.c)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.misc.c
	patch -p0 < ../diff.subwin.c
}

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --with-gpm
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
md5sums=('4faa5b71664287ce352378f7124fb93d'
         'c69ecca9cfe4a5094f39b72503d1c270'
         'c30358bfb7316ce34924f9aed10883da')
sha256sums=('00b3b926a413d9031f1ea1a546d96c3598f994698e340e6929100465c3da8f06'
            '91dcdb41fcf3c427587d5ab909db87de01f1d0bc4ea76909b2846488a262990a'
            'fe9455bd8d1dc528d4d5d8637eefcfcbe784a2698d6b7ac131f5efa6fc9f3404')

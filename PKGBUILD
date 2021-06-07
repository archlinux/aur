# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=tucnak
pkgver=4.26
pkgrel=1
pkgdesc="Ham Radio - VHF/HF contest logbook"
arch=('i686' 'x86_64')
url="http://tucnak.nagano.cz/"
license=('GPL')
depends=("libzia=4.26" 'fftw' 'libftdi-compat' 'portaudio' 'hamlib' \
	'gpm' 'rtl-sdr' 'sdl2')
makedepends=('pkg-config' 'autoconf')
conflicts=('tucnak3')
source=("http://tucnak.nagano.cz/$pkgname-$pkgver.tar.gz"
	diff.misc.c
	diff.subwin.c
	diff.configure.ac)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.misc.c
	patch -p0 < ../diff.subwin.c
	patch -p0 < ../diff.configure.ac
}

build() {
	cd $srcdir/$pkgname-$pkgver

	autoreconf --install --warnings=none
	./configure --prefix=/usr --with-gpm
	
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
md5sums=('10c378546c287813f274188837d49b8a'
         'c69ecca9cfe4a5094f39b72503d1c270'
         'c30358bfb7316ce34924f9aed10883da'
         '7c60c0681254303cc12f82c394a62891')
sha256sums=('6b9693fdf9ffa3a5138b85fbc51d9f1efb8f691062edac778f01fc7791a471ad'
            '91dcdb41fcf3c427587d5ab909db87de01f1d0bc4ea76909b2846488a262990a'
            'fe9455bd8d1dc528d4d5d8637eefcfcbe784a2698d6b7ac131f5efa6fc9f3404'
            '39e0fa525a9ebbf557779cc945fd7ca9874636f164878a118f7ea5b3c853d76e')

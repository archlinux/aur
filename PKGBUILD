# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=tucnak
pkgver=4.34
pkgrel=1
pkgdesc="Ham Radio - VHF/HF contest logbook"
arch=('i686' 'x86_64')
url="http://tucnak.nagano.cz/"
license=('GPL')
depends=('libzia=4.34' 'fftw' 'libsndfile' 'libftdi-compat' 'portaudio' \
	'hamlib' 'gpm' 'rtl-sdr' 'sdl2' 'hamradio-menus')
optdepends=('cwdaemon: transmitting cw'
	'winkeydaemon: transmitting cw')
makedepends=('autoconf' 'pkg-config')
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
md5sums=('885b5061239f5339be63bf184d94f2bb'
         'c69ecca9cfe4a5094f39b72503d1c270'
         'c30358bfb7316ce34924f9aed10883da'
         '7c60c0681254303cc12f82c394a62891')
sha256sums=('6b554f4a68c08c85e04fe3ceb9a493a1080e509ce8d0cf7e09a87b640983f9e7'
            '91dcdb41fcf3c427587d5ab909db87de01f1d0bc4ea76909b2846488a262990a'
            'fe9455bd8d1dc528d4d5d8637eefcfcbe784a2698d6b7ac131f5efa6fc9f3404'
            '39e0fa525a9ebbf557779cc945fd7ca9874636f164878a118f7ea5b3c853d76e')

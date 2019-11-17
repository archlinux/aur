# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=tucnak
pkgver=4.18
pkgrel=1
pkgdesc="Ham Radio - VHF/HF contest logbook"
arch=('i686' 'x86_64')
url="http://tucnak.nagano.cz/"
license=('GPL')
depends=("libzia=${pkgver}" 'fftw' 'libftdi-compat' 'portaudio' 'hamlib' 'gpm' 'rtl-sdr')
makedepends=('pkg-config')
conflicts=('tucnak3')
source=("http://tucnak.nagano.cz/$pkgname-$pkgver.tar.gz"
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
md5sums=('da88566439eb752141b3bfda870d605b'
         'c69ecca9cfe4a5094f39b72503d1c270'
         'c30358bfb7316ce34924f9aed10883da')
sha256sums=('bdecdcb44132186867b1af750bb30f41a254758ad011b72b81bd281474fcf327'
            '91dcdb41fcf3c427587d5ab909db87de01f1d0bc4ea76909b2846488a262990a'
            'fe9455bd8d1dc528d4d5d8637eefcfcbe784a2698d6b7ac131f5efa6fc9f3404')

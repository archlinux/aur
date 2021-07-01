# Maintainer: Bruno Bollos Correa <bollos@outlook.com.br>
# Contributor: Cheng Fei Phung <feiphung@hotmail.com>

pkgname=xyce-serial
pkgver=7.3.0
pkgrel=1
pkgdesc="The Xyce Parallel Electronic Simulator is a SPICE-compatible circuit simulator"
arch=('x86_64')
url="https://github.com/Xyce/Xyce"
license=('GPL3')
depends=('fftw' 'trilinos-xyce-serial')
makedepends=('gcc-fortran' 'cmake')
provides=('xyce')
conflicts=('xyce')
source=("https://github.com/Xyce/Xyce/archive/Release-"$pkgver".tar.gz")
sha256sums=('43869a70967f573ff6f00451db3f4642684834bdad1fd3926380e3789016b446')

build() {
	cd Xyce-Release-"$pkgver"

	./bootstrap

	./configure \
		CPPFLAGS="$CPPFLAGS -I/usr/include/trilinos -I/usr/include/suitesparse -L/usr/lib/trilinos" \
		CXXFLAGS="$CXXFLAGS -O3 -I/usr/include/trilinos -L/usr/lib/trilinos -std=c++11" \
		CFLAGS="$CFLAGS -O3 -I/usr/include/trilinos -L/usr/lib/trilinos" \
		FFLAGS="$FFLAGS -I/usr/include/trilinos -L/usr/lib/trilinos" \
		LDFLAGS="$LDFLAGS -L/usr/lib/trilinos" \
		--prefix=/usr \
		--enable-shared \
		--enable-xyce-shareable

	make
}

package() {
	cd Xyce-Release-"$pkgver"
	make DESTDIR="$pkgdir" install
}

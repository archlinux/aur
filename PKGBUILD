# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=gnuais
pkgver=0.2.8
pkgrel=1
pkgdesc="Open source software for demodulating and decoding AIS messages"
arch=('x86' 'x86_64')
url="http://gnuais.sourceforge.net/"
license=('GPLv2')
depends=('alsa-lib' 'libpulse')
makedepends=('cmake')
optdepends=('curl' 'mysql')
source=(https://github.com/rubund/gnuais/archive/$pkgver.zip)
md5sums=('398f90661991b008882df5bd293706c4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s/-O2/-O2 -lm/" CMakeLists.txt # Fix missing math lib
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: Jack L. Frost <fbt@fleshless.org>

pkgname='loksh'
pkgver='6.0'
pkgrel=1
pkgdesc="A Linux port of OpenBSD's ksh targeting musl"
arch=( 'i686' 'x86_64' )
url='https://github.com/dimkr/loksh'
license=( 'custom' )
source=( "https://github.com/dimkr/loksh/archive/${pkgver}.tar.gz" )

#_flag_static=1
if (( _flag_static )); then
	makedepends+=( 'musl' )
	_makeopts=( 'CC=musl-gcc' 'LDFLAGS=-static' )
else
	depends=( 'libbsd' )
	_makeopts=( 'LDFLAGS=-lbsd' )
fi

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make ${_makeopts[*]}
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" BIN_NAME='loksh' install
}

sha1sums=('31bdd59f6fddeb4b8a53f437ee4f026a18f424a5')

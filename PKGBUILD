# Maintainer: Jack L. Frost <fbt@fleshless.org>

pkgname='loksh'
pkgver='5.7'
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

sha1sums=( '78b355004365b3e9084323a6b6d03cc3b4892f3e' )

# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

_gitname=uWebSockets
pkgname=${_gitname,,}
pkgver=0.14.5
pkgrel=1
pkgdesc="µWS is one of the most lightweight, efficient & scalable WebSocket & HTTP server implementations available"
#arch=('i686' 'x86_64' 'armv6h' 'armv7h')
arch=('i686' 'x86_64')
url="https://github.com/uWebSockets/uWebSockets"
depends=('openssl' 'make' 'zlib' 'libuv')
makedepends=('cmake')
license=('ZLib')
conflicts=('uwebsockets')
provides=('uwebsockets')
replaces=('uwebsockets')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4e4a4bcde543baae57ca8f327304874d1bb1fb11b2c4f71618d2b3279003f2d5')
#options+=(!strip)

build()
{
	cd "${srcdir}/${_gitname}-${pkgver}"
	make $MAKEFLAGS
}

package()
{
	# Add the compiled library:
	mkdir -p "${pkgdir}/usr/lib"
	mv "${srcdir}/${_gitname}-${pkgver}/libuWS.so" "${pkgdir}/usr/lib"

	# Add the headers:
	mkdir -p "${pkgdir}/usr/include/uWS"
	mv "${srcdir}/${_gitname}-${pkgver}/src/"*.h "${pkgdir}/usr/include/uWS"
}

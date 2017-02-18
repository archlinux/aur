# Maintainer: GordonGR <ntheo1979@gmail.com>
# josephgbr <rafael.f.f1@gmail.com>

_pkgname=libdc1394
pkgname=lib32-${_pkgname}
pkgver=2.2.5
pkgrel=1
pkgdesc="High level programming interface to control IEEE 1394 based cameras (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://sourceforge.net/projects/libdc1394/"
depends=('lib32-libraw1394' 'lib32-libusb' "${_pkgname}")
makedepends=('gcc-multilib')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('01acfcde2cc85863b0acb90dcffa1659')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export LDFLAGS='-m32'
#SDL_CFLAGS = -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT
export SDL_CONFIG='/usr/bin/sdl-config-32'
export SDL_LIBS='-L/usr/lib32 -lSDL -lpthread'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

cd ${_pkgname}-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}

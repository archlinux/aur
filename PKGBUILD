# Maintainer: Fabian Maurer <dark.shadow4@web.de>

_pkgname=libmd
pkgname=lib32-libmd
pkgver=1.1.0
pkgrel=3
pkgdesc="Message Digest functions from BSD systems"
arch=('x86_64')
url="https://www.hadrons.org/software/libmd/"
license=('BSD')
depends=('lib32-glibc' 'libmd' 'lib32-gcc-libs')
source=("https://libbsd.freedesktop.org/releases/$_pkgname-$pkgver.tar.xz")
sha256sums=('1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332')

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
    cd ${_pkgname}-${pkgver}
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib32
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/usr/{include,share/man}
} 

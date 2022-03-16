# Maintainer: Fabian Maurer <dark.shadow4@web.de>

_pkgname=libmd
pkgname=lib32-libmd
pkgver=1.0.4
pkgrel=1
pkgdesc="Message Digest functions from BSD systems"
arch=('x86_64')
url="https://www.hadrons.org/software/libmd/"
license=('BSD')
depends=('glibc')
source=("https://libbsd.freedesktop.org/releases/$_pkgname-$pkgver.tar.xz")
sha256sums=('f51c921042e34beddeded4b75557656559cf5b1f2448033b4c1eec11c07e530f')

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

# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libulfius
_gitname=ulfius
pkgver=2.3.8
pkgrel=1
pkgdesc="HTTP Framework for REST API in C, using JSON, with websockets and streaming data"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('libmicrohttpd' 'jansson' 'curl' 'gnutls' 'libgcrypt' 'liborcania' 'libyder')
makedepends=(git cmake)
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("1b25e28f4a832a74290bc7e046a147ba7e462123355d284007239b58f39a8322")

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}-${pkgver}"/build
    cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        ../
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"/build
    make DESTDIR="$pkgdir" install
}

# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libulfius
_gitname=ulfius
pkgver=2.3.6
pkgrel=4
pkgdesc="HTTP Framework for REST API in C, using JSON, with websockets and streaming data"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('libmicrohttpd' 'jansson' 'curl' 'gnutls' 'libgcrypt')
makedepends=(git cmake)
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("dbf1c4f32768d41b6e45b844f32927b9ae8dbccfa2cc8c6607755a6ee105d9a6")

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    git init
    git remote add origin https://github.com/babelouest/ulfius.git
    git submodule update --init
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

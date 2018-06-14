# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libulfius
_gitname=ulfius
pkgver=2.3.6
pkgrel=3
pkgdesc="HTTP Framework for REST API in C, using JSON, with websockets and streaming data"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('libmicrohttpd' 'jansson' 'curl' 'gnutls' 'libgcrypt')
makedepends=(git cmake)
source=("git://github.com/babelouest/${_gitname}.git")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${_gitname}"
    git checkout tags/v${pkgver}
    git submodule update --init
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}"/build
    cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        ../
    make
}

package() {
    cd "${srcdir}/${_gitname}"/build
    make DESTDIR="$pkgdir" install
}

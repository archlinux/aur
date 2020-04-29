# Maintainer: Federico Di Pierro <nierro92@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>
pkgname=libulfius
_gitname=ulfius
pkgver=2.6.6
pkgrel=1
pkgdesc="HTTP Framework for REST API in C, using JSON, with websockets and streaming data"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('libmicrohttpd' 'jansson' 'curl' 'gnutls' 'libgcrypt' 'libyder')
makedepends=('git' 'cmake')
source=("git+https://github.com/babelouest.git#tag=v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_gitname}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}"
    cmake -B build \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release"
    make -C build
}

package() {
    cd "${srcdir}/${_gitname}"
    make-C build DESTDIR="$pkgdir" install
}

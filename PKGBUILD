# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=liborcania
_gitname=orcania
pkgver=1.2.8
pkgrel=1
pkgdesc="Potluck with different functions for different purposes that can be shared among C programs"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('jansson')
makedepends=(git cmake)
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("de71726f067e10ecd5a370d486f9aa0aad12a0927d59e36e9b15b2bc7c30ce4c")

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

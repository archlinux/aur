# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libyder
_gitname=yder
pkgver=1.4.4
pkgrel=1
pkgdesc="Logging library for C applications"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('liborcania')
makedepends=(git cmake)
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("cffec884fc57ce9b524800f8bada043cc12267eb334371d2785acd25aede34ff")

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

# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Federico Di Pierro <nierro92 at gmail dot com>

pkgname=liborcania
_gitname=orcania
pkgver=2.1.1
pkgrel=1
pkgdesc="Potluck with different functions for different purposes that can be shared among C programs"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('jansson')
makedepends=(git cmake)
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('960074f6aa198e9db5440347d20cff8be3b82ee1c15ac7b23c0ac54a301a85cd')

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}-${pkgver}"/build
    cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_BUILD_TYPE="Release" \
        ../
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"/build
    make DESTDIR="$pkgdir" install
}

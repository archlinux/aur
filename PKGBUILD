# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libmodule
pkgver=5.0.1
pkgrel=1
pkgdesc="C linux library to build simple and modular projects"
arch=(any)
url="https://github.com/FedeDP/${pkgname}"
license=(MIT)
depends=()
makedepends=(git cmake)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("35506360272cb13c0a09f17db6f716cf1c3e9fe40ac1bd574e4dc67916f7ca0a")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"/build
    cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        ../
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"/build
    make DESTDIR="$pkgdir" install
}

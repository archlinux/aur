# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libmodule
pkgver=5.0.0
pkgrel=1
pkgdesc="C linux library to build simple and modular projects"
arch=(any)
url="https://github.com/FedeDP/${pkgname}"
license=(MIT)
depends=()
makedepends=(git cmake)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("fa82567c56313b69bea589f7a1a027217b722b9c885c2d645a826d8af307a6c9")

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

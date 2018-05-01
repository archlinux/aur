# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libmodule
pkgver=1.0.0
pkgrel=2
pkgdesc="C linux library to build simple and modular projects"
arch=(x86_64)
url="https://github.com/FedeDP/${pkgname}"
license=(GPL)
depends=()
makedepends=(git cmake)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("ac78c531bd0140d75ef88575f53b46c9a7190abf27f32bb9b3e1ffb1a2335125")

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

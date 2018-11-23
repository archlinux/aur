# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libmodule
pkgver=3.1.1
pkgrel=1
pkgdesc="C linux library to build simple and modular projects"
arch=(x86_64)
url="https://github.com/FedeDP/${pkgname}"
license=(GPL)
depends=()
makedepends=(git cmake)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("85317898ebd78125eca5d68d1ff59eb83bb946d4324c38b8b5061c7719fe0dec")

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

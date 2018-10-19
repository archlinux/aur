# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=libyder
_gitname=yder
pkgver=1.4.3
pkgrel=1
pkgdesc="Logging library for C applications"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('liborcania')
makedepends=(git cmake)
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("b5a3aebcd4483d954b6540d2908863d1dad37954684ca45981da415432bc14a4")

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

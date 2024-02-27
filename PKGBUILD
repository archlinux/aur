# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=vsomeip
pkgver=3.4.10
pkgrel=1
pkgdesc="An implementation of Scalable service-Oriented MiddlewarE over IP"
arch=('x86_64')
url="https://github.com/COVESA/vsomeip"
license=('MPL2')
depends=('boost')
makedepends=('asciidoc' 'benchmark' 'cmake' 'doxygen' 'graphviz' 'source-highlight')
optdepends=()
source=("https://github.com/COVESA/vsomeip/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a7eacb5aab4ed9e4fc16cc37aab2fc1633ce8ca77e0d0665a76e34a4e6cd2639')

prepare() {
    :
}

build() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake -E env CXXFLAGS="-Wno-error=stringop-overflow" \
    cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr \
             -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    cd build
    DESTDIR="${pkgdir}" make install
    mv "${pkgdir}/usr/etc" "${pkgdir}"
}

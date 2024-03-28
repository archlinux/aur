# Maintainer:
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=yyjson
pkgver=0.8.0
pkgrel=1
pkgdesc="A high performance JSON library written in ANSI C"
arch=('x86_64')
url="https://ibireme.github.io/yyjson/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibireme/yyjson/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b2e39ac4c65f9050820c6779e6f7dd3c0d3fed9c6667f91caec0badbedce00f3')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}

# vim:set ts=4 sw=4 et:

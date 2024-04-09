# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=yyjson
pkgver=0.9.0
pkgrel=1
pkgdesc="A high performance JSON library written in ANSI C"
arch=('x86_64')
url="https://ibireme.github.io/yyjson"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibireme/yyjson/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('59902bea55585d870fd7681eabe6091fbfd1a8776d1950f859d2dbbd510c74bd')

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

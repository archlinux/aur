# shellcheck disable=SC2148,SC2034,SC2154
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Zacharias Knudsen <zachasme@gmail.com>
pkgname=h3
pkgver=4.3.0
pkgrel=2
pkgdesc="Hexagonal hierarchical geospatial indexing system"
arch=('x86_64' 'x86_64_v3')
url="https://github.com/uber/h3"
license=('Apache-2.0')
makedepends=('cmake' 'make' 'gcc' 'libtool')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b86905541bd5d94ad896ae3ee6e301556d2e54417045d37f0549b4c1c462d32869f55985f2986f3b99aa768731abfc3bc13b83ec506d73bcdcb57ada663d7714')

build() {
    cmake -B "build" -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DENABLE_LINTING=0 \
        -Wno-dev
    cmake --build "build"
}

check() {
    cmake --build "build" --target test
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build" --prefix "/usr"
}

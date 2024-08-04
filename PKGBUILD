# Maintainer: Windel Bouwman <windel@windel.nl>
# Contributor: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=foonathan_memory
pkgver=0.7.3
_pkgver=0.7-3
pkgrel=1
pkgdesc="STL compatible C++ memory allocator library using a new RawAllocator concept that is similar to an Allocator but easier to use and write."
url="https://memory.foonathan.net/"
arch=('x86_64')
license=('Zlib')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foonathan/memory/archive/v${_pkgver}.tar.gz")
sha256sums=('4203d15db22a94a3978eeb1afb59a37d35c57c0f148733f0f1a53a6281cb74dd')

build() {
    cmake -B build -S "${srcdir}/memory-${_pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DFOONATHAN_MEMORY_BUILD_EXAMPLES=OFF \
        -DFOONATHAN_MEMORY_BUILD_TESTS=OFF
    cmake --build build
}

package() {
    install -Dm644 "${srcdir}/memory-${_pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    DESTDIR="${pkgdir}" cmake --install build
}

# Maintainer: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=foonathan_memory
pkgver=0.6.2
_pkgver=0.6-2
pkgrel=1
pkgdesc="STL compatible C++ memory allocator library using a new RawAllocator concept that is similar to an Allocator but easier to use and write."
url="http://foonathan.net/memory"
arch=('x86_64')
license=('ZLIB')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foonathan/memory/archive/v${_pkgver}.tar.gz"
        'git+https://github.com/foonathan/compatibility.git#commit=cd14212')
sha256sums=('cf302578f3b6721707b8428fd9b97182ada1970ce56f8881ea0b3390b97e66e3' 'SKIP')

prepare() {
    cd "${srcdir}/memory-${_pkgver}/"
    rm -rf build && mkdir build

    cd cmake/comp
    ln -sf "${srcdir}/compatibility/comp_base.cmake"
}

build() {
    cd "${srcdir}/memory-${_pkgver}"

    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/memory-${_pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd build
    make DESTDIR="${pkgdir}/" install
}

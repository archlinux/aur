# Maintainer: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=foonathan_memory
pkgver=0.7.0
_pkgver=0.7
pkgrel=1
pkgdesc="STL compatible C++ memory allocator library using a new RawAllocator concept that is similar to an Allocator but easier to use and write."
url="http://foonathan.net/memory"
arch=('x86_64')
license=('ZLIB')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foonathan/memory/archive/v${_pkgver}.tar.gz")
sha256sums=('01a7cc5a5ebddbd71bec69c89562a4a2ecd7c29334c0a29d38d83e7f7f66eb53')

build() {
    cd "${srcdir}/memory-${_pkgver}"
    if [ -d build ]; then
        rm -rf build
    fi
    mkdir build

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

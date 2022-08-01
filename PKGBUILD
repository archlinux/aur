# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
# Contributor: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=foonathan_memory-shared
_pkgver=0.7-2
pkgver=$(echo "$_pkgver" | sed 's/-/./')
pkgrel=1
pkgdesc="STL compatible C++ memory allocator library build with BUILD_SHARED_LIBS=ON"
url="https://www.jonathanmueller.dev/project/#memory"
arch=('x86_64')
license=('ZLIB')
makedepends=('cmake' 'git')
conflicts=('foonathan_memory')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foonathan/memory/archive/v${_pkgver}.tar.gz")
sha256sums=('8aba7211bb0e59b7538decda453e492cc6e36f8781508ed92b38cbafe8a48762')

build() {
    cd "${srcdir}/memory-${_pkgver}"

    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_SHARED_LIBS=ON \
          .
    make -C build
}

package() {
    cd "${srcdir}/memory-${_pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd build
    make DESTDIR="${pkgdir}/" install
}

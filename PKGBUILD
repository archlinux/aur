pkgname=cockatrice-client-beta
pkgver=3.1.1beta
pkgrel=1
pkgdesc='Open-source multiplatform program for playing tabletop card games over a network (development beta release)'
arch=('x86_64')
url='https://cockatrice.github.io/'
license=('GPL-2.0-only')

depends=(
    'hicolor-icon-theme'
    'openssl'
    'protobuf'
    'qt6-base'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-shadertools'
    'qt6-svg'
    'qt6-websockets'
    'xz'
    'zlib'
)

makedepends=(
    'cmake'
    'ninja'
    'qt6-tools'
)

conflicts=('cockatrice-client-stable' 'cockatrice-client-git' 'cockatrice')
provides=('cockatrice-client')

source=("https://github.com/Cockatrice/Cockatrice/archive/refs/tags/2026-10-09-Development-3.1.1-beta.zip")
sha256sums=('SKIP')

build() {
    cd "$srcdir"/*Cockatrice*

    cmake -B build -S . -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    cd "$srcdir"/*Cockatrice*
    DESTDIR="$pkgdir" cmake --install build
}

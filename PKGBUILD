pkgname=cockatrice-client-beta
pkgver=3.1.0.94
pkgrel=1
pkgdesc='Open-source multiplatform program for playing tabletop card games over a network (development beta release)'
arch=('x86_64')
url='https://cockatrice.github.io/'
license=('GPL2')

depends=(
    'protobuf'
    'qt6-base'
    'qt6-svg'
    'qt6-tools'
    'qt6-multimedia'
    'qt6-websockets'
    'hicolor-icon-theme'
)

makedepends=(
    'cmake'
    'mariadb-libs'
    'xz'
    'zlib'
    'ninja'
)

optdepends=(
    'mariadb: database support'
)

conflicts=('cockatrice-client-stable' 'cockatrice-client-git' 'cockatrice')
provides=('cockatrice-client')

source=(
    "cockatrice-${pkgver}.tar.gz::https://github.com/Cockatrice/Cockatrice/archive/refs/tags/2026-08-08-Development-3.1.0-beta.4.zip"
)

sha256sums=('SKIP')

build() {
    cd "$srcdir"/*Cockatrice*

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja

    cmake --build build
}

check() {
    cd "$srcdir"/*Cockatrice*/build
    ctest --output-on-failure
}

package() {
    cd "$srcdir"/*Cockatrice*/build
    DESTDIR="$pkgdir" cmake --install .
}

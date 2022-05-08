# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=corrosion
pkgver=0.2.1
_commit=28fa50ca44f68313e7345dd59d79599a91df57a7
pkgrel=1
pkgdesc="Tool for integrating Rust into an existing CMake project"
arch=('x86_64')
url="https://github.com/corrosion-rs/corrosion"
license=('MIT')
depends=('rust' 'cmake')
makedepends=('git')
source=("git+${url}.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cmake -S "$pkgname" \
        -B build \
        -DCORROSION_BUILD_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    cmake --build build --config Release
}

package() {
    DESTDIR="${pkgdir}" cmake --install build --config Release
}

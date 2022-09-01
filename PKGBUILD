# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=corrosion
pkgver=0.2.2
_commit=f2539090b1ecfebaeef3699755cca6a8d2166d41
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

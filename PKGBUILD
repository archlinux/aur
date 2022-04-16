# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=corrosion
pkgver=0.1.0
_commit=9e42e832d1ce207d6669a4ff898d705fdc3c98c2
pkgrel=1
pkgdesc="Integrate Rust into existing CMake projects"
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/corrosion-rs/corrosion"
license=('MIT')
depends=('rust' 'cmake')
makedepends=('git')
source=("git+${url}.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCORROSION_BUILD_TESTS=OFF \
        -B build \
        -S "$pkgname"

    cmake --build build --config Release
}

package() {
    DESTDIR="${pkgdir}" cmake --install build --config Release
}

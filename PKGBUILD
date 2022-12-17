# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=corrosion
pkgver=0.3.1
_commit=90ed7e0b73cd5cdffbd0f048751cf423368db439
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

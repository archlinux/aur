# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Yuki Takagi <takagiy.4dev@gmail.com>

pkgname=immer
pkgver=0.8.0
pkgrel=1
pkgdesc="Postmodern immutable and persistent data structures for C++"
arch=("any")
url="https://sinusoid.es/immer"
license=("Boost")
makedepends=("cmake")
optdepends=("gc: garbage collected heap support")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arximboldi/immer/archive/v${pkgver}.tar.gz")
b2sums=("01efc9cf733cf40a94cd0b73b7d23e852870be1e69eab9f9b0a115077fc4000b5b45c07306a221a529287f00fa2b83c56ff3860ab40223a0b8a80d47b52e1af4")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D immer_BUILD_DOCS:BOOL="OFF" \
    -D immer_BUILD_EXAMPLES:BOOL="OFF" \
    -D immer_BUILD_EXTRAS:BOOL="OFF" \
    -D immer_BUILD_TESTS:BOOL="OFF" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}

# Maintainer: Stefan Zipproth <s.zipproth@acrion.ch>

pkgname=zelph
pkgver=0.9.2
pkgrel=1
pkgdesc="A sophisticated semantic network system capable of encoding inference rules within the network itself. Built for efficient memory usage and powerful logical reasoning, it can process the entire Wikidata knowledge graph (1.7TB) to detect contradictions and make logical deductions."
arch=('x86_64')
url="https://github.com/acrion/zelph"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'gcc')
source=("git+https://github.com/acrion/zelph.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${pkgname}"
    cmake -B build -S src \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}

package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir/" cmake --install build
}

# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=binv
pkgrel=1
pkgver=1.0.0
pkgdesc="Command line tool to bitwise invert a complete file"
url="https://github.com/NikolasK-source/bitwise_invert"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git')
source=("git+https://github.com/NikolasK-source/bitwise_invert.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd bitwise_invert
    git submodule init
    git submodule update
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -DBUILD_DOC=OFF -B build .
}

build() {
    cd bitwise_invert
    cmake --build build
}

package() {
    cd bitwise_invert
    install -Dm755 build/binv "${pkgdir}/usr/bin/binv"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

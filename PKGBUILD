# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=cxxitimer
pkgrel=2
pkgver=2.0.5
pkgdesc="A C++ Library to handle linux interval timer"
url="https://gitlab.com/nikolask-cpp-libs/cxxitimer"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'clang')
source=("git+https://gitlab.com/nikolask-cpp-libs/cxxitimer.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd cxxitimer
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -DCLANG_TIDY=OFF -DBUILD_DOC=OFF -DCMAKE_CXX_COMPILER=$(which clang++) -B build .
}

build() {
    cd cxxitimer
    cmake --build build
}

package() {
    cd cxxitimer
    cmake --install build --config Release --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

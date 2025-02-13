# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=cxxitimer
pkgrel=1
pkgver=2.0.4
pkgdesc="A C++ Library to handle linux interval timer"
url="https://github.com/NikolasK-source/cxxitimer"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake')
source=("git+https://github.com/NikolasK-source/cxxitimer.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd cxxitimer
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -DCLANG_TIDY=OFF -DBUILD_DOC=OFF -B build .
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

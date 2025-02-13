# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=cxxshm
pkgrel=1
pkgver=2.0.4
pkgdesc="A C++ library to handle POSIX shared memory"
url="https://github.com/NikolasK-source/cxxshm"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake')
source=("git+https://github.com/NikolasK-source/cxxshm.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd cxxshm
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -DCLANG_TIDY=OFF -DBUILD_DOC=OFF -B build .
}

build() {
    cd cxxshm
    cmake --build build
}

package() {
    cd cxxshm
    cmake --install build --config Release --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

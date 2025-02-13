# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=cxxsemaphore
pkgrel=1
pkgver=2.0.4
pkgdesc="A C++ library to handle POSIX named semaphores "
url="https://github.com/NikolasK-source/cxxsemaphore"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake')
source=("git+https://github.com/NikolasK-source/cxxsemaphore.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd cxxsemaphore
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -DCLANG_TIDY=OFF -DBUILD_DOC=OFF -B build .
}

build() {
    cd cxxsemaphore
    cmake --build build
}

package() {
    cd cxxsemaphore
    cmake --install build --config Release --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

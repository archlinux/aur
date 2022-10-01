# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=shared-mem-random
pkgrel=1
pkgver=1.1.0
pkgdesc="write random values to a shared memory"
url="https://github.com/NikolasK-source/shared_mem_random"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git')
source=("git+https://github.com/NikolasK-source/shared_mem_random.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd shared_mem_random
    git submodule init
    git submodule update
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -B build .
}

build() {
    cd shared_mem_random
    cmake --build build
}

package() {
    cd shared_mem_random
    install -Dm755 build/shared-mem-random "${pkgdir}/usr/bin/shared-mem-random"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=dump-shm
pkgrel=1
pkgver=1.1.0
pkgdesc="dump content of a shared memory to stdout"
url="https://github.com/NikolasK-source/dump_shm"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git')
source=("git+https://github.com/NikolasK-source/dump_shm.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd dump_shm
    git submodule init
    git submodule update
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -B build .
}

build() {
    cd dump_shm
    cmake --build build
}

package() {
    cd dump_shm
    install -Dm755 build/dump-shm "${pkgdir}/usr/bin/dump-shm"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=stdin-to-modbus-shm
pkgrel=1
pkgver=1.1.1
pkgdesc="Read instructions from stdin and write them to a modbus shared memory"
url="https://github.com/NikolasK-source/stdin_to_modbus_shm"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git')
source=("git+https://github.com/NikolasK-source/stdin_to_modbus_shm#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd stdin_to_modbus_shm
    git submodule init
    git submodule update
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -B build .
}

build() {
    cd stdin_to_modbus_shm
    cmake --build build
}

package() {
    cd stdin_to_modbus_shm
    install -Dm755 build/stdin-to-modbus-shm "${pkgdir}/usr/bin/stdin-to-modbus-shm"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

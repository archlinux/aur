# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=stdin-to-modbus-shm
pkgrel=2
pkgver=1.5.0
pkgdesc="Read instructions from stdin and write them to a modbus shared memory"
url="https://github.com/SHMModbus/stdin_to_modbus_shm"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git' 'cxxopts' 'cxxshm' 'cxxsemaphore')
depends=('cxxshm' 'cxxsemaphore')
source=("git+https://github.com/SHMModbus/stdin_to_modbus_shm#tag=v${pkgver}")

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

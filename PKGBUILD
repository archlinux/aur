# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=wago-modbus-coupler-shm
pkgrel=2
pkgver=1.1.1
pkgdesc="sync wago modbus tcp coupler with shared memory"
url="https://github.com/SHMModbus/wago_modbus_coupler_shm"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git')
source=("git+https://github.com/SHMModbus/wago_modbus_coupler_shm.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd wago_modbus_coupler_shm
    git submodule init
    git submodule update
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -B build .
}

build() {
    cd wago_modbus_coupler_shm
    cmake --build build
}

package() {
    cd wago_modbus_coupler_shm
    install -Dm755 build/wago_modbus_coupler_shm "${pkgdir}/usr/bin/wago-modbus-coupler-shm"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

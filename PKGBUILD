# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=modbus-tcp-client-shm
pkgrel=1
pkgver=1.7.0
pkgdesc="modbus tcp client that stores its data (registers) in shared memory"
url="https://github.com/SHMModbus/modbus_tcp_client_shm"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git' 'cxxopts' 'cxxshm' 'cxxsemaphore' 'libmodbus')
depends=('cxxshm' 'cxxsemaphore' 'libmodbus')
source=("git+https://github.com/SHMModbus/modbus_tcp_client_shm.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd modbus_tcp_client_shm
    git submodule init
    git submodule update
    
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -DCLANG_FORMAT=OFF -DCLANG_TIDY=OFF -B build .
}

build() {
    cd modbus_tcp_client_shm
    cmake --build build
}

package() {
    cd modbus_tcp_client_shm
    install -Dm755 build/modbus-tcp-client-shm "${pkgdir}/usr/bin/modbus-tcp-client-shm"
}

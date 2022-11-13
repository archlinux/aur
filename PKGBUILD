# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=modbus-tcp-client-shm
pkgrel=1
pkgver=1.3.0
pkgdesc="modbus tcp client that stores its data (registers) in shared memory"
url="https://github.com/NikolasK-source/modbus_tcp_client_shm"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git')
source=("git+https://github.com/NikolasK-source/modbus_tcp_client_shm.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd modbus_tcp_client_shm
    git submodule init
    git submodule update
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -B build .
}

build() {
    cd modbus_tcp_client_shm
    cmake --build build
}

package() {
    cd modbus_tcp_client_shm
    install -Dm755 build/modbus-tcp-client-shm "${pkgdir}/usr/bin/modbus-tcp-client-shm"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

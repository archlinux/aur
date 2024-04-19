# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=write-shm
pkgrel=2
pkgver=1.1.1
pkgdesc="Write to a shared memory"
url="https://github.com/SHMModbus/write_shm"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git' 'cxxopts' 'cxxshm' 'cxxsemaphore')
depends=('cxxshm' 'cxxsemaphore')
source=("git+https://github.com/SHMModbus/write_shm.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd write_shm
    git submodule init
    git submodule update
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -DCLANG_TIDY=OFF -B build .
}

build() {
    cd write_shm
    cmake --build build
}

package() {
    cd write_shm
    install -Dm755 build/write-shm "${pkgdir}/usr/bin/write-shm"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

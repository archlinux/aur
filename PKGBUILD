# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=shm-format
pkgrel=1
pkgver=2.1.0
pkgdesc="Read values with specified data type from shared memory."
url="https://github.com/SHMModbus/shm_format"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'git' 'cxxopts' 'cxxshm' 'cxxsemaphore' 'nlohmann-json')
depends=('cxxshm' 'cxxsemaphore' 'nlohmann-json')
source=("git+https://github.com/SHMModbus/shm_format.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd shm_format   
    cmake -DCMAKE_BUILD_TYPE=Release -DCOMPILER_WARNINGS=OFF -DCLANG_FORMAT=OFF -DCLANG_TIDY=OFF -DBUILD_DOC=OFF -DENABLE_TEST=OFF -B build .
}

build() {
    cd shm_format
    cmake --build build
}

package() {
    cd shm_format
    DESTDIR="$pkgdir" cmake --install build
}

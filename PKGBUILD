# Maintainer: Artem Klevtsov <a.a.klevtso@gmail.com>

pkgname=redpanda
_gitname=rstudio
pkgver=20.12.9
pkgrel=1
pkgdesc='Redpanda is a streaming platform for mission critical workloads'
arch=('x86_64')
url='https://github.com/vectorizedio/redpanda'
license=('custom')
depends=('gnutls' 'numactl' 'c-ares' 'hwloc' 'snappy' 'lz4' 'zstd' 'fmt' 'xxhash' 'yaml-cpp' 'protobuf' 'crypto++')
makedepends=('git' 'cmake' 'ninja' 'valgrind' 'boost' 'curl' 'rapidjson' 'stow' 'lksctp-tools' 'dpdk' 'ragel' 'python' 'python-jinja')
optdepends=()
conflicts=('redpanda-git')
replaces=('redpanda-git')
source=("https://github.com/vectorizedio/redpanda/archive/v${pkgver}.tar.gz")
sha256sums=('f6d453b60b57902676b9a6f6c1ddd5c4da83562eb2efd7f75ffea22beed4ecbd')

build() {
    cd "${srcdir}/redpanda-${pkgver}"
    export CC=/usr/bin/gcc
    export CXX=/usr/bin/g++
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_UNITY_BUILD=ON \
          -DCMAKE_C_COMPILER=$CC \
          -DCMAKE_CXX_COMPILER=$CXX \
          -Bbuild \
          -GNinja .
    ninja -C build
}

package() {
    cd "${srcdir}/redpanda-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}

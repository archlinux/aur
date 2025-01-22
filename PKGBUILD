# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
pkgname=buildbox
pkgver=1.2.40
pkgrel=1
pkgdesc="A set of tools for remote worker build execution"
arch=(x86_64)
url="https://buildgrid.build"
license=(Apache-2.0)
depends=(
  'glibc'
  'gcc-libs'
  'abseil-cpp'
  'fuse3'
  'google-glog'
  'grpc'
  'openssl'
  'protobuf'
  'util-linux-libs'
  'bubblewrap'
)
makedepends=(
  'benchmark'
  'c-ares'
  'cmake'
  'git'
  'gmock'
  'gtest'
  'net-tools'
  'ninja'
  'nlohmann-json'
  'tomlplusplus'
)
provides=('buildbox-casd' 'buildbox-fuse' 'buildbox-run-bubblewrap')
conflicts=('buildbox-casd' 'buildbox-fuse' 'buildbox-run-bubblewrap')
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cmake -B build -S $pkgname \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DTOOLS=OFF \
    -DCASD=ON \
    -DCASD_BUILD_BENCHMARK=OFF \
    -DFUSE=ON \
    -DRECC=ON \
    -DRUN_BUBBLEWRAP=ON \
    -DWORKER=ON \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


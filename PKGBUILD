# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from DeepSeek V4 Flash.

pkgname=zxc
pkgver=0.12.0
pkgrel=1
pkgdesc="Asymmetric lossless compression CLI — ultra-fast decode, 40%+ faster than LZ4 on ARM64 (source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/hellobertrand/zxc"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'gcc')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellobertrand/zxc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DZXC_BUILD_CLI=ON \
    -DZXC_BUILD_TESTS=OFF \
    -DZXC_NATIVE_ARCH=OFF
  cmake --build build -j"$(nproc)"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "build/zxc" "${pkgdir}/usr/bin/zxc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

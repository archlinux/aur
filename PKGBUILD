# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=zxc
pkgver=0.15.0
pkgrel=1
pkgdesc="Asymmetric lossless compression CLI — ultra-fast decode, 40%+ faster than LZ4 on ARM64 (source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/hellobertrand/zxc"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'gcc')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellobertrand/zxc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1af49a9d40e644740dca75f176c03535e123f6d0ba81833552b77a70e6eeabaa')

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

# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from DeepSeek V4 Flash.

pkgname=zxc-full
pkgver=0.13.3
pkgrel=1
pkgdesc="Asymmetric lossless compression library for ultra-fast decode (development: CLI + C library + headers + CMake — source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/hellobertrand/zxc"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'gcc')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellobertrand/zxc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('46ff1c9f8c78c19cd891abbbf15b80025f6bbcedd515ddb6ce6c8d91175b5653')

build() {
  cd "${srcdir}/zxc-${pkgver}"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DZXC_BUILD_CLI=ON \
    -DZXC_BUILD_TESTS=OFF \
    -DZXC_NATIVE_ARCH=OFF
  cmake --build build -j"$(nproc)"
}

package() {
  cd "${srcdir}/zxc-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build --prefix /usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

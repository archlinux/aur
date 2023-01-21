# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=cctag
pkgver=1.0.3
pkgrel=7
pkgdesc="Detection of CCTag markers made up of concentric circles"
arch=('x86_64')
url="https://github.com/alicevision/CCTag"
license=('MPL2')
depends=('boost-libs' 'tbb' 'cuda' 'qt5-base' 'opencv')
makedepends=('boost' 'cmake' 'eigen' 'ninja')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alicevision/CCTag/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('25396b03c4aa3c1be241a2a8518a29511cb4fff695caa5126203fbba8e8e444d')


build() {
  cd CCTag-$pkgver

  cmake \
    -Bbuild \
    -GNinja \
    -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCCTAG_ENABLE_SIMD_AVX2=ON \
    -DCCTAG_CUDA_CC_LIST_INIT="5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 8.7 8.9 9.0"
  ninja -C build
}

package() {
  cd CCTag-$pkgver

  DESTDIR="${pkgdir}" ninja -C build install
}
# vim:set ts=2 sw=2 et:

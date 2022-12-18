# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocwmma
pkgver=5.4.1
pkgrel=1
pkgdesc='Library for accelerating mixed precision matrix multiplication'
arch=('x86_64')
url='https://rocwmma.readthedocs.io/en/latest/index.html'
license=('MIT')
depends=('hip' 'rocblas' 'openmp')
makedepends=('rocm-cmake' 'doxygen')
_git='https://github.com/ROCmSoftwarePlatform/rocWMMA'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('641d2730db737edcade8da6b3f77ce85d4ad460e0902c2b688df2d51fb13f9f0')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

build() {
    cmake \
      -Wno-dev \
      -B build \
      -S "$_dirname" \
      -DCMAKE_INSTALL_PREFIX=/opt/rocm \
      -DCMAKE_BUILD_TYPE=None \
      -DROCWMMA_BUILD_TESTS=OFF \
      -DROCWMMA_BUILD_SAMPLES=OFF
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

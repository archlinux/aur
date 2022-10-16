# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocwmma
pkgver=5.3.0
pkgrel=1
pkgdesc='Library for accelerating mixed precision matrix multiplication'
arch=('x86_64')
url='https://rocwmma.readthedocs.io/en/latest/index.html'
license=('MIT')
depends=('hip' 'rocblas' 'openmp')
makedepends=('rocm-cmake' 'git' 'doxygen')
_git='https://github.com/ROCmSoftwarePlatform/rocWMMA'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('04bac641ba18059118d3faa5f21fe3bf3e285055d40930489ebf27ffc8e5d16e')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

build() {
    cmake \
      -Wno-dev \
      -B build \
      -S "$_dirname" \
      -DCMAKE_INSTALL_PREFIX=/opt/rocm \
      -DROCWMMA_BUILD_TESTS=OFF \
      -DROCWMMA_BUILD_SAMPLES=OFF
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

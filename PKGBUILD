# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=hipify-clang
pkgver=5.0.1
pkgrel=1
pkgdesc='Convert CUDA to Portable C++ Code '
arch=('x86_64')
url='https://github.com/ROCm-Developer-Tools/HIPIFY'
license=('unknown')
depends=('rocm-llvm' 'cuda')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('3f58b7dea52622e0f7f14987d911357cb8ed3423671904bf98c3d62fd874b617')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  cmake -Wno-dev -B build \
        -S "$_dirname" \
        -DLLVM_DIR=/opt/rocm/llvm/lib/cmake/llvm \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip/bin
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
}

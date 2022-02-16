# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=hipify-clang
pkgver=5.0.0
pkgrel=1
pkgdesc='Convert CUDA to Portable C++ Code '
arch=('x86_64')
url='https://github.com/ROCm-Developer-Tools/HIPIFY'
license=('unknown')
depends=('rocm-llvm' 'cuda')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('06fbb3259b6d014bc24fb3c05f71026bc39ae564559d40f2ca37236044c7ba17')
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

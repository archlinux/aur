# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=hipify-clang
pkgver=4.5.2
pkgrel=1
pkgdesc='Convert CUDA to Portable C++ Code '
arch=('x86_64')
url='https://github.com/ROCm-Developer-Tools/HIPIFY'
license=('unknown')
depends=('rocm-llvm' 'cuda')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('f0d401e634642a1d6659b9163a38661ee38da1e1aceabb1f16f78f8fce048a4e')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  cmake -Wno-dev -B build \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip/bin
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
}

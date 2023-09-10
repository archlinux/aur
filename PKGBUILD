pkgname=mlir16
pkgver=16.0.6
pkgrel=1
pkgdesc="Multi-Level IR Compiler Framework for LLVM"
arch=('x86_64')
url="https://mlir.llvm.org/"
license=("custom:Apache 2.0 with LLVM Exception")
depends=("llvm=$pkgver")
makedepends=("cmake")
provides=("mlir=${pkgver}")
conflicts=("mlir")
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz")
sha256sums=('ce5e71081d17ce9e86d7cbcfa28c4b04b9300f8fb7e78422b1feb6bc52c3028e')

build() {
  cmake -S llvm-project-${pkgver}.src/mlir -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DMLIR_LINK_MLIR_DYLIB=ON \
    -DLLVM_BUILD_TOOLS=ON \
    -DLLVM_BUILD_UTILS=ON \
    -DLLVM_ENABLE_PIC=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}

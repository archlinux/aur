# Maintainer: cyberfined <cyberfined@protonmail.com>
pkgname=llvm12
pkgver=12.0
pkgrel=1
pkgdesc='Collection of modular and reusable compiler and toolchain technologies'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://llvm.org'
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('git' 'cmake' 'make' 'libffi' 'libedit' 'python' 'jsoncpp')
options=('strip')
source=('https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/llvm-12.0.0.src.tar.xz')
sha256sums=('49dc47c8697a1a0abd4ee51629a696d7bfe803662f2a7252a3b16fc75f3a8b50')

build() {
  mkdir "$srcdir/llvm-12.0.0.src/build"
  cd "$srcdir/llvm-12.0.0.src/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/local \
        -DLLVM_INCLUDE_BENCHMARKS=OFF \
        -DLLVM_INCLUDE_TESTS=OFF \
        -DLLVM_INCLUDE_EXAMPLES=OFF \
        -DLLVM_ENABLE_FFI=ON \
        -DLLVM_BUILD_LLVM_DYLIB=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        ..
  cmake --build . -- -j4
}

package() {
  cd "$srcdir/llvm-12.0.0.src/build"
  DESTDIR=$pkgdir cmake --install .
}

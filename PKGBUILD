# Maintainer: Forrest Hilton <forrestmhilton (at) Gmail dot com>
pkgname=llvm12
pkgver=12.0.1
pkgrel=1
pkgdesc='Collection of modular and reusable compiler and toolchain technologies'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://llvm.org'
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('git' 'cmake' 'make' 'libffi' 'libedit' 'python' 'jsoncpp' 'clang')
options=('strip')
source=('https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/llvm-12.0.1.src.tar.xz')
sha256sums=('7d9a8405f557cefc5a21bf5672af73903b64749d9bc3a50322239f56f34ffddf')

build() {
  mkdir "$srcdir/llvm-12.0.1.src/build"
  cd "$srcdir/llvm-12.0.1.src/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/local \
        -DLLVM_INCLUDE_BENCHMARKS=OFF \
        -DLLVM_INCLUDE_TESTS=OFF \
        -DLLVM_INCLUDE_EXAMPLES=OFF \
        -DLLVM_ENABLE_FFI=ON \
        -DLLVM_BUILD_LLVM_DYLIB=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_FLAGS="-include stdint.h" \
        -DCMAKE_CXX_FLAGS="-include stdint.h" \
        ..
  cmake --build .
}

package() {
  cd "$srcdir/llvm-12.0.1.src/build"
  DESTDIR=$pkgdir cmake --install .
}

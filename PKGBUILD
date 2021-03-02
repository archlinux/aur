# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libclc
pkgver=11.1.0
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'llvm' 'cmake' 'ninja' 'python' 'git')
source=("git+https://github.com/llvm/llvm-project.git#tag=llvmorg-$pkgver")
md5sums=('SKIP')

prepare() {
  cd llvm-project/libclc
  mkdir build
}

build() {
  cd llvm-project/libclc/build

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd llvm-project/libclc/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


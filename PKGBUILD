# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libclc
pkgver=22.1.1
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=('cmake' 'ninja' 'clang' 'llvm' 'python' 'spirv-llvm-translator')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})
sha256sums=('9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              'FFB3368980F3E6BB5737145A316C56D064CACBA5'  # Douglas Yung <douglas.yung@sony.com>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85'  # Cullen Rhodes <cullen.rhodes@arm.com>
)

prepare() {
  cd llvm-project-$pkgver.src/libclc
  mkdir build
}

build() {
  cd llvm-project-$pkgver.src/libclc/build


  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
  )

  cmake .. "${cmake_args[@]}"
  ninja
}

package() {
  cd llvm-project-$pkgver.src/libclc/build

  DESTDIR="$pkgdir" ninja install

  install -Dm644 "$srcdir/llvm-project-$pkgver.src/libclc/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

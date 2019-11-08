# Maintainer: Frederick Gnodtke <frederick at gnodtke dot de>

pkgname=llvm-xtensa-git
pkgver=20191108
pkgrel=1
pkgdesc='LLVM fork for ESP32 xtensa.'
arch=('x86_64')
url='https://github.com/espressif/llvm-xtensa'
license=('GPL')
depends=(
    'python2'
    'libxml2'
    'python')
makedepends=(
    'git'
    'ninja'
    'cmake')
provides=('llvm-xtensa')
source=(
    'git://github.com/espressif/llvm-xtensa'
    'git://github.com/espressif/clang-xtensa')
sha256sums=('SKIP'
    'SKIP')

_llvm_gitname='llvm-xtensa'
_clang_gitname='clang-xtensa'
_llvm_builddir='llvm_build'

pkgver() {
    date '+%Y%m%d'
}

build() {
  ln -sf ../../$_clang_gitname $_llvm_gitname/tools/clang
  mkdir -p $_llvm_builddir
  cd $_llvm_builddir
  cmake ../$_llvm_gitname/ -DLLVM_TARGETS_TO_BUILD="Xtensa;X86" -DCMAKE_BUILD_TYPE=Release -G "Ninja" -DLLVM_INSTALL_UTILS=ON
  cmake --build .
}

package() {
  cd "${srcdir}/$_llvm_builddir"
  cmake --install . --prefix "${pkgdir}/opt/llvm-xtensa"
}

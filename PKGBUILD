# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>

pkgname=ldc-xtensa-git
pkgver=1.20.1
pkgrel=2
pkgdesc='LDC built for ESP32 xtensa.'
arch=('x86_64')
url='https://github.com/espressif/llvm-xtensa'
license=('GPL')
depends=(
    'llvm-xtensa'
    'python2'
    'libxml2'
    'python')
makedepends=(
    'ldc'
    'llvm-xtensa'
    'git'
    'ninja'
    'cmake')
provides=('llvm-xtensa')
source=("https://github.com/ldc-developers/ldc/releases/download/v${pkgver}/ldc-${pkgver}-src.tar.gz")
sha256sums=('SKIP')

build() {
  mkdir -p build-ldc
  cd build-ldc
  cmake -G Ninja ../ldc-${pkgver}-src \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/ldc-xtensa \
    -DLLVM_ROOT_DIR=/opt/llvm-xtensa
  cmake --build .
}

package() {
  cd build-ldc
  DESTDIR="${pkgdir}" cmake --install . 
}

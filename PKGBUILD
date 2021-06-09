# Maintainer: Guillaume Dolle  <dev at gdolle.com>
pkgname=cpp-ghc-filesystem
pkgver=1.5.6
pkgrel=1
pkgdesc="ghc C++ header-only single-file std filesystem compatible helper library"
arch=('i686' 'x86_64')
url="https://github.com/gulrak/filesystem"
license=('MIT')
depends=('gcc' 'cmake')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/gulrak/filesystem/archive/v${pkgver}.tar.gz)
md5sums=('95b3b55c4f5e29f5915a1b21111e043f')

prepare(){
  cd ${pkgname/cpp-ghc-/}-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -B build
}

build() {
  cd ${pkgname/cpp-ghc-/}-${pkgver}
  cmake --build build
}

check() {
  cd ${pkgname/cpp-ghc-/}-${pkgver}/build
  ctest
}

package() {
  cd ${pkgname/cpp-ghc-/}-${pkgver}
  cmake --install build
}


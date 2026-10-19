# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>

pkgname=xbyak
pkgver=7.43
pkgrel=1
pkgdesc='A C++ JIT assembler for x86 (IA32), x64 (AMD64, x86-64)'
arch=('any')
url='https://github.com/herumi/xbyak'
license=('BSD')
makedepends=(
  # 'git'
  'cmake'
)
# tests require multilib repository
#checkdepends=('nasm' 'yasm' 'boost')
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('80721f56b6e63f146a3760dc9bbd95c194ce534aa902ebe1676ff73d71f0aee76888765c4c279b636f41c3d4d73c2e8cf68019e09ffe3c86ce5b729cedee78bd')

# pkgver() {
#   cd "$pkgname"
#
#   git describe --tags | sed 's/^v//'
# }

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev

  cmake --build build
}

#check() {
#  cd "$pkgname"
#
#  make test
#
#  make -C sample CXXFLAGS+="-DXBYAK_NO_EXCEPTION"
#}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname-$pkgver"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" readme.{md,txt}

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT
}

# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>

pkgname=xbyak
pkgver=7.37.3
pkgrel=2
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
b2sums=('5c75a776c86a4b9defcaea134615300887eaeeeb36b70211c26a05d60e0d42e9cf80fba0c8b484dfe8d55b237672e3f83779f6a09ae1ce337fe5ec7a10dd5bae')

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

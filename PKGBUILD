# Maintainer: Vladislav Grechannik <vgrechannik@gmail.com>

pkgname=xbyak
pkgver=7.37
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
b2sums=('a1098c042f02d0fe80ce64549beacc44eecaa0474548d84a59b1377151261d0fb23625ccd75e174e245e43c721f5e4564d4cee3bef660695e8ae435b84d5af34')

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

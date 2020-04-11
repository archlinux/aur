pkgname=llvm-cbe-git
pkgver=b110169
pkgrel=1
pkgdesc="resurrected LLVM C Backend, with improvements"
arch=(x86_64)
url="https://github.com/JuliaComputing/llvm-cbe"
license=('LLVM Release License')
depends=('llvm')
makedepends=('cmake')

source=(
  "git+https://github.com/woachk/llvm-cbe.git#branch=fix-llvm9"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd llvm-cbe
  git rev-parse --short HEAD
}

build() {
  cd llvm-cbe
  mkdir -p build
  cd build
  cmake .. -DUSE_SYSTEM_LLVM=ON
  make -j
}

package() {
  install -Dm644 "$srcdir"/llvm-cbe/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "$srcdir"/llvm-cbe/build/tools/llvm-cbe/llvm-cbe "$pkgdir"/usr/bin/llvm-cbe
}

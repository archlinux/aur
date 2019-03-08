pkgname=llvm-cbe-git
pkgver=a66518a
pkgrel=1
pkgdesc="resurrected LLVM C Backend, with improvements"
arch=(x86_64)
url="https://github.com/JuliaComputing/llvm-cbe"
license=('LLVM Release License')
depends=('llvm')
source=(
  "https://github.com/llvm-mirror/llvm/archive/release_70.zip"
  "git+https://github.com/JuliaComputing/llvm-cbe.git"
)
sha256sums=('7c3d96b4df6517ff1168cddc61251e7d41eaee17742d7515578c42576664f97e'
            'SKIP')

pkgver() {
  cd llvm-cbe
  git rev-parse --short HEAD
}

build() {
  ln -sf llvm-cbe llvm-release_70/projects
  cd llvm-release_70
  mkdir -p build
  cd build
  ls Makefile || cmake ..
  make
}

package() {
  install -Dm644 "$srcdir"/llvm-cbe/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "$srcdir"/llvm-release_70/build/bin/llvm-cbe "$pkgdir"/usr/bin/llvm-cbe
}
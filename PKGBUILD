# Maintainer: Christian Bergschneider <christian.bergschneider@gmx.de>

pkgname=slingshot-git
pkgver=r276.f9a3673
pkgrel=1
pkgdesc="SystemVerilog language server based on Slang"
arch=('x86_64')
url="https://github.com/mlyoung101/slingshot"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'ninja' 'clang')
provides=('slingshot')
conflicts=('slingshot')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd slingshot
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S slingshot -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++

  cmake --build build
}

package() {
  install -Dm755 build/slingshot "$pkgdir/usr/bin/slingshot"
  install -Dm644 slingshot/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

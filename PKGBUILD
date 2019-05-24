# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=basis-universal-git
pkgver=r186.92bc0de0ea
pkgrel=1
pkgdesc="Basis Universal GPU Texture Codec"
arch=('x86_64')
url="https://github.com/BinomialLLC/basis_universal"
license=('Apache')
makedepends=('cmake' 'ninja')
source=("git+$url")
sha256sums=('SKIP')
provides=(basis-universal basisu)
conflicts=(basis-universal)

pkgver() {
  cd basis_universal
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short=10 HEAD)
}

prepare() {
  cd basis_universal
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    .
}

build() {
  cd basis_universal
  ninja
}

package() {
  cd basis_universal
  DESTDIR="$pkgdir" ninja install
}

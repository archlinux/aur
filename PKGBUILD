# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=basis-universal-git
pkgver=1.08+19.gbbbce07039
pkgrel=1
pkgdesc="Basis Universal GPU Texture Codec"
arch=('x86_64')
url="https://github.com/BinomialLLC/basis_universal"
license=('Apache')
makedepends=('git' 'cmake' 'ninja')
source=("git+$url")
sha256sums=('SKIP')
provides=(basis-universal basisu)
conflicts=(basis-universal)

pkgver() {
  cd basis_universal
  git describe --long --abbrev=10 --tags | sed 's/-/+/; s/-/./'
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

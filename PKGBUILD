# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ruy-git
pkgver=r564.9940fbf
pkgrel=1
pkgdesc="Matrix multiplication library for neural network inference engines"
arch=('x86_64' 'aarch64')
url="https://github.com/google/ruy"
license=('Apache')
depends=('cpuinfo-pytorch-git')
makedepends=('git' 'cmake' 'ninja')
provides=('ruy')
conflicts=('ruy')
source=("ruy::git+https://github.com/google/ruy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ruy"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/ruy"

  cmake -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DRUY_FIND_CPUINFO=ON \
    -DRUY_MINIMAL_BUILD=ON

  cmake --build build
}

package() {
  cd "$srcdir/ruy"
  DESTDIR="$pkgdir" cmake --install build
}

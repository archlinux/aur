pkgname=mgard-git
pkgver=r79.11744c7
pkgrel=1
pkgdesc="MultiGrid Adaptive Reduction of Data"
license=('Apache')
arch=('x86_64')
url="https://github.com/CODARcode/MGARD"
depends=('blosc')
makedepends=('cmake' 'git')
provides=('mgard')
conflicts=('mgard')
source=("git+https://github.com/CODARcode/MGARD.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/MGARD"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd MGARD
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        ..
  make
}

package() {
  cd MGARD/build
  make DESTDIR="$pkgdir" install
}


pkgname=darknet-hankai-git
pkgver=3.0
pkgrel=1
pkgdesc="Darknet: neural network framework for object detection"
arch=('x86_64')
url="https://github.com/hank-ai/darknet"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'git' 'wget' 'file' 'base-devel' 'cudnn' 'cuda' 'opencv')
conflicts=()
source=("git+https://github.com/hank-ai/darknet.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/darknet" || return 1
  git fetch --tags
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/darknet"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j"$(nproc)"
}

package() {
  cd "$srcdir/darknet/build"
  make install DESTDIR="$pkgdir"
}

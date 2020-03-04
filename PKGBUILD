# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=hipcpu-git
_pkgname=hipCPU
pkgver=latest
pkgrel=1
pkgdesc="Implementation of AMD HIP for CPUs"
arch=('i686' 'x86_64')
url="http://github.com/illuhad/hipCPU"
license=('BSD')
depends=('openmp')
makedepends=('git' 'cmake')
provides=('hipcpu')
conflicts=('hipcpu')
source=("git+https://github.com/illuhad/hipCPU.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}

pkgname=kenlm
pkgver=r2268.217e219
pkgrel=1
pkgdesc="Faster and Smaller Language Model Queries"
license=('LGPL')
arch=('x86_64')
url="https://kheafield.com/code/kenlm/"
depends=('boost-libs' 'python')
makedepends=('cmake' 'eigen' 'git' 'cython')
source=("git+https://github.com/kpu/kenlm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kenlm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "$srcdir/kenlm/python"
  cython kenlm.pyx --cplus
}

build() {
  cd "$srcdir/kenlm"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_PYTHON=ON .
  make
}

package() {
  cd "$srcdir/kenlm"
  make DESTDIR="$pkgdir" install
}


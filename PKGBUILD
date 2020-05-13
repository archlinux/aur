pkgname=kenlm
pkgver=r2201.5239f2e
pkgrel=1
pkgdesc="Faster and Smaller Language Model Queries"
license=('LGPL')
arch=('x86_64')
url="https://kheafield.com/code/kenlm/"
depends=('boost-libs')
makedepends=('cmake' 'eigen' 'git')
source=("git+https://github.com/kpu/kenlm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kenlm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/kenlm"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$srcdir/kenlm"
  make DESTDIR="$pkgdir" install
}


# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=phyml-mpi-git
pkgver=r121.ab59039
pkgrel=1
pkgdesc="Phylogenetic estimation using (Maximum) Likelihood"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml/"
license=('GPL2')
depends=('openmpi')
makedepends=('git')
conflicts=('phyml-mpi')
provides=('phyml-mpi')

source=("phyml-git::git+https://github.com/stephaneguindon/phyml")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/phyml-git

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/phyml-git

  autoreconf -fi
}

build() {
  cd $srcdir/phyml-git

  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-mpi

  make
}

package() {
  cd $srcdir/phyml-git

  make DESTDIR=$pkgdir install
}

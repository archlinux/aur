# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=diamond-aligner-git
pkgver=0.9.24.r46.gd333bab
pkgrel=2
pkgdesc="Accelerated BLAST compatible local sequence aligner"

url='https://github.com/bbuchfink/diamond'
arch=('x86_64')

license=('GPL3')

depends=('gcc-libs' 'zlib')
makedepends=('cmake' 'git')

source=("git+https://github.com/bbuchfink/diamond.git")
sha256sums=('SKIP')

pkgver() {
  cd diamond
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
   ln -s diamond diamond-$pkgver
   mkdir -p diamond-$pkgver/build

}

build() {
  cd diamond-$pkgver/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
 
  make

}

check() {
  cd diamond-$pkgver/build
  ./diamond --version

}

package() {
  cd diamond-$pkgver/build

  make DESTDIR="$pkgdir" install
}
 

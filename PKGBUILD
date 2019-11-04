# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

_name=diamond
pkgname=diamond-aligner-git
pkgver=0.9.27.r1.g58ee82e
pkgrel=1
pkgdesc='Accelerated BLAST compatible local sequence aligner'

url='https://github.com/bbuchfink/diamond'
arch=('x86_64')

license=('GPL3')

depends=('gcc-libs' 'zlib')
makedepends=('cmake' 'git')

source=("git+https://github.com/bbuchfink/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
   mkdir $_name/build

}

build() {
  cd $_name/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
 
  make

}

check() {
  cd $_name/build
  ./$_name --version

}

package() {
  cd $_name/build

  make DESTDIR="$pkgdir" install

}

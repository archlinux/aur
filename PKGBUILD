# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=iqtree-mpi
_pkgname=iqtree2
pkgver=2.3.6
pkgrel=1
pkgdesc="Efficient phylogenomic software by maximum likelihood; multicore version (OMP). https://doi.org/10.1093/molbev/msaa015"
arch=(x86_64)
url="https://github.com/iqtree/iqtree2"
license=('GPL2')
depends=('boost-libs' 'gcc-libs' 'zlib' 'openmpi' 'nvidia-utils')
makedepends=('cmake' 'make' 'gcc' 'git' 'boost' 'eigen')
source=("git+$url.git#tag=v${pkgver}")
md5sums=('edf69e616ea84c9d78c9493b64731e81')

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
}

build() {
  cd $_pkgname
  mkdir -p build && cd build
  cmake -DIQTREE_FLAGS=mpi ..
  make
}

package() {
  cd $_pkgname/build 
  chmod +x $_pkgname-mpi
  install -Dm 755 $_pkgname-mpi ${pkgdir}/usr/bin/$pkgname
}

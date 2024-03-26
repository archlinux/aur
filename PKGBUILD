# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=iqtree-mpi
_pkgname=iqtree2
pkgver=2.3.1
pkgrel=1
pkgdesc="Efficient phylogenomic software by maximum likelihood; multicore version (OMP). https://doi.org/10.1093/molbev/msaa015"
arch=(x86_64)
url="https://github.com/iqtree/iqtree2"
license=('GPL2')
depends=('boost-libs' 'gcc-libs' 'zlib' 'openmpi' 'nvidia-utils')
makedepends=('cmake' 'make' 'gcc' 'git' 'boost' 'eigen')
source=("git+$url.git#tag=v${pkgver}")
md5sums=('251b8d817e26f87a99150450dedcbd75')

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

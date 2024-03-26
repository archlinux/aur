# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=iqtree
_pkgname=iqtree2
pkgver=2.3.1
pkgrel=1
pkgdesc="Efficient phylogenomic software by maximum likelihood https://doi.org/10.1093/molbev/msaa015"
arch=(x86_64)
url="https://github.com/iqtree/iqtree2"
license=('GPL2')
depends=('boost-libs' 'gcc-libs' 'zlib')
makedepends=('cmake' 'eigen' 'make' 'gcc' 'git' 'boost')
source=("git+$url.git#tag=v${pkgver}")
md5sums=('251b8d817e26f87a99150450dedcbd75')

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
}

build() {
  cd $_pkgname
  mkdir -p build && cd build
  cmake -DIQTREE_FLAGS=omp ..
  make
}

package() {
  cd $_pkgname/build 
  chmod +x $_pkgname
  install -Dm 755 $_pkgname ${pkgdir}/usr/bin/$pkgname
}

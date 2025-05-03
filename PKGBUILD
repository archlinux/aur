# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=iqtree
_pkgname=iqtree3
pkgver=3.0.0
pkgrel=1
pkgdesc="Efficient phylogenomic software by maximum likelihood https://doi.org/10.1093/molbev/msaa015"
arch=(x86_64)
url="https://github.com/iqtree/${_pkgname}"
license=('GPL-2.0-or-later')
depends=('boost-libs' 'gcc-libs' 'zlib')
makedepends=('cmake' 'eigen' 'make' 'gcc' 'git' 'boost')
source=("git+$url.git#tag=v${pkgver}")
md5sums=('d6e201df7726673580828c9e3e0c6698')

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

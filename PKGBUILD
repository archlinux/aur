# Maintainer: Guoyi ("malcology") <guoyizhang@malacology.net>
# Contributor: Guoyi ("malcology") <guoyizhang@malacology.net>

pkgname=raxml-ng-mpi
pkgver=1.2.2
pkgrel=1
pkgdesc="A phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion. https://doi.org/10.1093/bioinformatics/btz305"
url='https://github.com/amkozlov/raxml-ng'
arch=('x86_64')
license=('AGPL3')
depends=('gcc-libs' 'openmpi' 'cuda')
makedepends=('bison' 'make' 'cmake' 'flex' 'gmp' 'gtest' 'git')
source=("git+https://github.com/amkozlov/raxml-ng.git#tag=${pkgver}")
sha256sums=('9e5ba42b45ce51197148a1f0e8fd3eeddc867a06bfb3b763bb8121d808155baf')
provides=('raxml-ng')
conflicts=('raxml-ng')
prepare(){
  cd ${srcdir}/raxml-ng
  git submodule update --init --recursive
  sed -i "s@-std=c++11@-std=c++14@g" CMakeLists.txt
}
build(){
  cd "${srcdir}"/raxml-ng
  mkdir -p build
  cd build
  cmake -DUSE_MPI=ON ..
  make
}
package() {
  cd ${srcdir}/raxml-ng/bin
  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

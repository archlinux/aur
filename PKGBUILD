# Maintainer: Guoyi ("malcology") <guoyizhang@malacology.net>
# Contributor: Guoyi ("malcology") <guoyizhang@malacology.net>

pkgname=raxml-ng
pkgver=1.1.0
pkgrel=19
pkgdesc="A phylogenetic tree inference tool which uses maximum-likelihood (ML) optimality criterion. https://doi.org/10.1093/bioinformatics/btz305"
url='https://github.com/amkozlov/raxml-ng'
arch=('x86_64')
license=('AGPL3')
depends=('gcc-libs')
makedepends=('bison' 'make' 'cmake' 'flex' 'gmp' 'gtest' 'git')
source=("git+https://github.com/amkozlov/raxml-ng.git#tag=${pkgver}")
sha256sums=('SKIP')
prepare(){
  cd ${srcdir}/raxml-ng
  git submodule update --init --recursive
}
build(){
  cd "${srcdir}"/raxml-ng
  mkdir -p build
  cd build
  cmake ..
  make
}
package() {
  cd ${srcdir}/raxml-ng/bin
  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

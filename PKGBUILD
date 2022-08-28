# Maintainer: Guoyi ("malcology") <guoyizhang@malacology.net>
# Contributor: Guoyi ("malcology") <guoyizhang@malacology.net>

pkgname=modeltest-ng-mpi
pkgver=0.1.7
pkgrel=7
pkgdesc="A New and Scalable Tool for the Selection of DNA and Protein Evolutionary Models. https://doi.org/10.1093/molbev/msz189"
url='https://github.com/ddarriba/modeltest'
arch=('x86_64')
depends=('openmpi')
makedepends=('bison' 'git' 'cmake' 'make' 'flex')
license=('GPL3')
source=("git+https://github.com/ddarriba/modeltest.git#tag=v${pkgver}")
sha256sums=('SKIP')
provides=('modeltest-ng')
conflicts=('modeltest-ng')
prepare(){
  cd ${srcdir}/modeltest
  git submodule update --init --recursive
}
build(){
  cd ${srcdir}/modeltest/
  mkdir build && cd build
  cmake -DUSE_MPI=ON ..
  make
}

package() {
  install -dm755 "${pkgdir}"/usr/bin
  install -Dm755 "${srcdir}/modeltest/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

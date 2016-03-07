# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=combblas
pkgver=1.5.0
pkgrel=1
url="http://gauss.cs.ucsb.edu/~aydin/CombBLAS/html/"
pkgdesc="Combinatorial BLAS Library"
makedepends=('cmake')
depends=('openmpi')
arch=('i686' 'x86_64')
license=("MIT")
source=("http://gauss.cs.ucsb.edu/~aydin/CombBLAS_FILES/CombBLAS_beta_15_0.tgz")
sha256sums=('626f26f34dce8e2cc2c189d3ab52dbc2959268c71755f6e7dca5ba5f9302ade5')

build() {
  cd "${srcdir}/CombBLAS"
  install -d build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON ..
  make
}

package() {
  cd "${srcdir}/CombBLAS/build"

  install -d "${pkgdir}/usr/include/combblas"
  cp ../*.h "${pkgdir}/usr/include/combblas"

  install -d "${pkgdir}/usr/lib"
  cp *.so "${pkgdir}/usr/lib"

  install -Dm644 "${srcdir}/CombBLAS/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

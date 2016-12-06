# Contributor: Michael Straube <straubem gmx de>
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=combblas
pkgver=1.5.0
pkgrel=2
pkgdesc="Combinatorial BLAS Library"
arch=('i686' 'x86_64')
url="http://gauss.cs.ucsb.edu/~aydin/CombBLAS/html/"
license=("MIT")
depends=('openmpi')
makedepends=('cmake')
source=("http://gauss.cs.ucsb.edu/~aydin/CombBLAS_FILES/CombBLAS_beta_15_0.tgz"
        "http://gauss.cs.ucsb.edu/~aydin/CombBLAS_FILES/testdata_combblas1.2.1.tgz")
sha256sums=('626f26f34dce8e2cc2c189d3ab52dbc2959268c71755f6e7dca5ba5f9302ade5'
            '003bd04528ee89b543b5d123f8dd9d248c8f45a917278b46962a100c4516f505')

prepare() {
  mkdir CombBLAS/build
  ln -s "$srcdir"/TESTDATA CombBLAS/build/TESTDATA
}

build() {
  cd CombBLAS/build

  cmake ..\
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  make
}

check() {
  cd CombBLAS/build

  make test
}

package() {
  cd CombBLAS/build

  install -d "$pkgdir"/usr/{lib,include/combblas}

  install -m 644 ../*.h "$pkgdir"/usr/include/combblas/
  install -m 755 *.so "$pkgdir"/usr/lib/

  install -D -m 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

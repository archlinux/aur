# Maintainer: Michael Straube <michael_straube web de>
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
sha1sums=('e2a9ff8d33c03f6e2a68d7c64098d3c1120364dc'
          'bf87cca1a5e476826933677b4084c3decbb4147e')

build() {
  install -d CombBLAS/build
  cd CombBLAS/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON ..
  make
}

check() {
  cd CombBLAS/build

  ln -s "$srcdir/TESTDATA" TESTDATA
  make test
}

package() {
  cd CombBLAS/build

  install -d -m 755 "$pkgdir"/usr/{lib,include/combblas}

  install -m 644 ../*.h "$pkgdir/usr/include/combblas/"
  install -m 755 *.so "$pkgdir/usr/lib/"

  install -D -m 644 ../LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

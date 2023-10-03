# vim: set ts=2 sw=2 et:
# Maintainer: Wang Ling <lingwang@wcysite.com>

pkgname=ieda
pkgver=0.949.97089a9e
pkgrel=1
pkgdesc="An pen-source from netlist to GDS EDA platform for ASIC design."
arch=('any')
url="https://github.com/OSCC-Project/iEDA/"
license=('custom:MulanPSL2')
depends=('flex' 'boost-libs' 'google-glog' 'gtest'
         'gflags' 'tcl' 'yaml-cpp' 'libunwind'
         'metis' 'gmp')
makedepends=('gcc' 'cmake' 'ninja' 'boost' 'eigen' 'git')
provides=('iEDA' 'iSTA' 'iPower' 'ista_cpp.cpython-311-x86_64-linux-gnu.so' 'ipower_cpp.cpython-311-x86_64-linux-gnu.so')
conflicts=()
source=("iEDA::git+https://github.com/OSCC-Project/iEDA.git"
        "local://header.patch")
sha256sums=('SKIP'
            '5b5effd588e498146b92987ee22a5ed209838c6e58dc900e2ceb6e48791862d2')

prepare() {
  cd iEDA
  git checkout 97089a9ebb889519d7d8914ad42ebd66c94c2a19
  cd ..
  patch --directory="$srcdir/iEDA/" --forward --strip=1 --input="$srcdir/header.patch"
}

build() {
  cd iEDA
  ./build.sh
}

package() {
  install -Dm755 $srcdir/iEDA/bin/iEDA $pkgdir/usr/bin/iEDA
  install -Dm755 $srcdir/iEDA/bin/iSTA $pkgdir/usr/bin/iSTA
  install -Dm755 $srcdir/iEDA/bin/iPower $pkgdir/usr/bin/iPower
}

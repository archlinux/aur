# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=raxml-ng
pkgver=0.9.0
_release=0a064e9a40f2e00828662795141659d946440c81
pkgrel=1
pkgdesc="A phylogenetic tree inference tool which uses maximum-likelihood (ML)\
 optimality criterion"

url='https://github.com/amkozlov/raxml-ng'
arch=('x86_64')

license=('AGPL3')

depends=('gcc-libs')

makedepends=('git' 'cmake' 'bison' 'flex' 'gmp')

source=("git+https://github.com/amkozlov/$pkgname.git#commit=$_release")

# source=("https://github.com/amkozlov/$pkgname/archive/$pkgver.tar.gz")
# sha256sums=('43b95ee1bddae0daee84644e9ee760a77f28bb16e2071e95cca79a30f39373e5')
sha256sums=('SKIP')

prepare() {
    cd $pkgname

    git submodule update --init --recursive

    mkdir build/
    cd build/

    cmake ..
}

build() {
  cd $pkgname/build
  
  make
}

check() {
  cd $pkgname/bin

  ./$pkgname -v | grep -Pxq "RAxML-NG v\. 0\.9\.0 released on \d+\.\d+\.\d+ by The Exelixis Lab\."
}

package() {
  cd $pkgname

  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}

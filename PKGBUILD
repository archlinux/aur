# Maintainer: Roberto Rossini ("robymetallo") <roberros@insert_university_of_oslo_domain.no>

pkgname=raxml-ng
pkgver=1.0.2
_commit=411611611793e53c992717d869ca64370f2e4789
pkgrel=1
pkgdesc="A phylogenetic tree inference tool which uses maximum-likelihood (ML)\
 optimality criterion"

url='https://github.com/amkozlov/raxml-ng'
arch=('x86_64')

license=('AGPL3')

depends=('gcc-libs')

makedepends=('bison' 'cmake' 'flex' 'git' 'gmp')

checkdepends=('gmock' 'gtest')

source=("git+https://github.com/amkozlov/$pkgname.git#commit=$_commit")

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
  cd $pkgname/build
  make test

  #./$pkgname -v | grep -Pxq "RAxML-NG v\. 1\.0\.2 released on \d+\.\d+\.\d+ by The Exelixis Lab\."
}

package() {
  cd $pkgname

  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}

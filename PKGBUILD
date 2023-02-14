# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=mpboot
pkgver=1.2
pkgrel=1
pkgdesc="Fast phylogenetic maximum parsimony tree inference and bootstrap approximation https://doi.org/10.1186/s12862-018-1131-3"
arch=(x86_64)
url="https://github.com/diepthihoang/mpboot"
license=('GPL2')
depends=('eigen' 'gcc-libs' 'zlib')
makedepends=('cmake' 'make' 'clang' 'git')
source=("git+$url.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname
  mkdir -p build && cd build
  cmake -DIQTREE_FLAGS=avx -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ ..
  make
}

package() {
  cd $pkgname/build 
  chmod +x $pkgname-avx
  install -Dm 755 $pkgname-avx ${pkgdir}/usr/bin/$pkgname
}

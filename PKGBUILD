pkgname=generax
_pkgname=GeneRax
pkgver=2.1.3
pkgrel=2
arch=('x86_64')
url="https://github.com/BenoitMorel/GeneRax"
pkgdesc="A Tool for Species-Tree-Aware Maximum Likelihood-Based Gene  Family Tree Inference under Gene Duplication, Transfer, and Loss https://doi.org/10.1093/molbev/msaa141"
depends=('gcc-libs' 'gmp')
makedepends=('cmake' 'make' 'gcc' 'openmpi'  'bison' 'flex' 'git')
license=('AGPL')
source=("git+$url.git#tag=$pkgver")
md5sums=('0234c8f2728f4e1d6ec0f6afa0fb025c')

prepare(){
  cd $_pkgname
  git submodule update --init --recursive
}

build() {
  cd $_pkgname
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd $_pkgname
  cd build/bin
for bin in $(ls)
do
	install -Dm 755 $bin $pkgdir/usr/bin/$bin
done
}

pkgname=generax
_pkgname=GeneRax
pkgver=2.0.4
pkgrel=4
arch=('x86_64')
url="https://github.com/BenoitMorel/GeneRax"
pkgdesc="A Tool for Species-Tree-Aware Maximum Likelihood-Based Gene  Family Tree Inference under Gene Duplication, Transfer, and Loss https://doi.org/10.1093/molbev/msaa141"
depends=('gcc-libs' 'gmp')
makedepends=('cmake' 'make' 'gcc' 'openmpi'  'bison' 'flex' 'git')
license=('AGPL')
source=("git+$url.git#tag=$pkgver"
		"$pkgname.patch")
md5sums=('SKIP'
         'e11bd9f6fbedfb6e47b5b4a29dde98a0')

prepare(){
  cd $_pkgname
  git submodule update --init --recursive
  patch -p1 -i "${srcdir}/$pkgname.patch" #for 2.0.4
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

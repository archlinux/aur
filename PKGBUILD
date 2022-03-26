# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>

# XXX: The following warning cannot be removed because CMAKE stores the build
# directory in the executable 'iqtree'.

# ==> WARNING: Package contains reference to $srcdir
# usr/bin/iqtree

pkgname=iqtree
pkgver=2.1.3
pkgrel=4
pkgdesc="Efficient phylogenomic software by maximum likelihood; multicore version (OMP). https://doi.org/10.1093/molbev/msaa015"
arch=(x86_64)
url="http://www.iqtree.org/"
license=('GPL2')
depends=('boost' 'eigen' 'glibc' 'zlib')
makedepends=('cmake' 'make' 'gcc')
source=("iqtree2-$pkgver::https://github.com/iqtree/iqtree2/archive/v${pkgver}.tar.gz")
md5sums=('d20ca3e053852574dcbdd218f4e6ebfc')

build() {
  cd iqtree2-${pkgver}
  mkdir -p build
  cd build
  cmake -DIQTREE_FLAGS=omp ..
  make || bash -c "df -h"
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cd "$srcdir"/iqtree2-${pkgver}/build 
  chmod +x iqtree2
  mv iqtree2 ${pkgdir}/usr/bin/iqtree
}

pkgname=bucky
pkgver=1.4.4
pkgrel=4
pkgdesc="Bayesian Untangling of Concordance Knots https://doi.org/10.1093/bioinformatics/btq539"
arch=('x86_64')
conflicts=('mpi-bucky')
url="https://pages.stat.wisc.edu/~ane/bucky/"
license=('GPL')
depends=('gcc-libs' 'boost-libs')
makedepends=('clang' 'boost')
source=("http://dstats.net/download/http://www.stat.wisc.edu/~ane/bucky/v${pkgver%.*}/bucky-${pkgver}.tgz")
sha256sums=('1621fee0d42314d9aa45d0082b358d4531e7d1d1a0089c807c1b21fbdc4e4592')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  for file in TaxonSet Alias mbsumtree TGM Quartets mbsumtree
do
	clang++ -c $file.C
done
clang++ bucky.C TaxonSet.o Alias.o mbsumtree.o TGM.o Quartets.o -o bucky
clang++ mbsum.C mbsumtree.o -o mbsum 
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
for bin in bucky mbsum
do
  install -Dm 755 $bin $pkgdir/usr/bin/$bin
done
}

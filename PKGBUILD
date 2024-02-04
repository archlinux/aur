# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=dnarates
_pkg=DNArates
pkgver=1.1.0
pkgrel=0
arch=('x86_64')
pkgdesc="estimating site-specific nucleotide substitution rates by maximum likelihood \
	 https://doi.org/10.1093/nar/22.17.3485"
url='https://www.life.illinois.edu/gary/programs/DNArates.html'
license=('LicenseRef-unknow')
depends=('glibc')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tgz::https://www.life.illinois.edu/gary/programs/DNArates/DNArates_$pkgver.tar.gz"
	"1.1.0.patch")
sha1sums=('889037be0b9330712084ee6621bd488c9287c073'
          'cf36569312f7b72686aa26a958836d931ad79853')

prepare() {
  cd $srcdir/${_pkg}_$pkgver
  patch -p1 < $srcdir/1.1.0.patch
}

build() {
  cd $srcdir/${_pkg}_$pkgver/source
  gcc -o $_pkg $_pkg.c -lm
}

package() {
  cd $srcdir/${_pkg}_$pkgver
  # binary
  install -Dm 755 source/$_pkg $pkgdir/usr/bin/$_pkg 
  # docs
  install -Dm 644 docs/*.txt $pkgdir/usr/share/doc/$pkgname/manual.txt  
}

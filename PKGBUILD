# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=lvb
pkgver=4.2
pkgrel=0
pkgdesc="parsimony and simulated annealing in the search for phylogenetic trees \
	 https://doi.org/10.1093/bioinformatics/btg402"
arch=('x86_64')
url="https://github.com/phylolvb/lvb"
license=('custom')
depends=('gcc-libs' 'glibc')
makedepends=('make')
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('cdd51333fb82ab4ea356f5bc6cb3dc973d524bfed82cec63db6089f33f494da2')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  # example
  cp -r examples $pkgdir/usr/share/doc/$pkgname/
  # docs
  install -Dm 644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  # license
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
  # lib 
  install -Dm 755 libLVB.a $pkgdir/usr/lib/libLVB.a
  # binary
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}

# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=clann
pkgver=194f8aa
pkgrel=1
pkgdesc="constructing consensus trees and supertrees from multiple source trees \
	 https://doi.org/10.1093/bioinformatics/bti020"
arch=('x86_64')
url="https://github.com/ChrisCreevey/clann"
license=('GPL2')
depends=('readline')
makedepends=('autoconf' 'make')
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('4ac7bdb035743a2f53a7da96d4d8b22c95f94d117ffdf3380d88ad14322f88e4')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  autoreconf -i 
  ./configure --prefix="${pkgdir}"/usr
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  mkdir -p $pkgdir/usr/share/{doc/$pkgname,licenses/$pkgname}
  # example
  cp -r examples $pkgdir/usr/share/doc/$pkgname/
  # docs
  cp Docs/*.pdf $pkgdir/usr/share/doc/$pkgname/
  install -Dm 644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm 644 README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
  # license
  install -Dm 644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/COPYING.txt
  # binary
  make install
}

# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=preseq
pkgver=3.2.0
pkgrel=3
pkgdesc="A tool for predicting and estimating the complexity of a genomic sequencing library, equivalent to predicting and estimating the number of redundant reads from a given sequencing depth."
arch=('x86_64')
url="http://smithlabresearch.org/software/preseq/"
depends=('gsl' 'htslib')
makedepends=('make')
license=('GPL3')
source=("https://github.com/smithlabcode/preseq/releases/download/v${pkgver}/preseq-${pkgver}.tar.gz"
	"$pkgname-3.2.0.patch")
md5sums=('293486920e3f6fcdab2418b8413f9cbd'
         '56a5e2d72618d28f45ac001857fe4a7c')

prepare() {
  cd "${pkgname}-${pkgver}"
  cd src/smithlab_cpp
  patch -p1 < $srcdir/$pkgname-3.2.0.patch 
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix="${pkgdir}/usr" --enable-hts
  make all
}

package() {
  cd "${pkgname}-${pkgver}"
  make install
}


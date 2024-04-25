# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggtreeDendro
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Drawing 'dendrogram' using 'ggtree'"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-ggtree
  r-tidytree
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-aplot
  r-knitr
  r-mdendro
  r-prettydoc
  r-pvclust
  r-rmarkdown
  r-testthat
  r-treeio
  r-yulab.utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e5839d466e08665eb2475a99fb74e833')
b2sums=('efc1dbc33976571770de4b4536df82de4d9304ae41665dfdfbcd3a9fc2f685bcfdead26a977acbacd1fea658ace5fcc50572304d4db8da63b8110e6ca52eec1b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

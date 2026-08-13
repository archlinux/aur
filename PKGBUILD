# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggtreeDendro
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('6e5a32ac07ad654b99d3885e31b21520')
b2sums=('c3b4010a0c093ff881d9ad92ede7c943a0d3f476789b27daa9fcaac5f50b686a5d11fc67744829e8d70ef2ca5ac63d14b450127d95727bed86cac6f646e62762')

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

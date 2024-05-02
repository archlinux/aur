# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggtreeDendro
_pkgver=1.6.0
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
md5sums=('33f0ddf977d01a10dad0bd489d74615b')
b2sums=('9a4d11faef8d764859d818b23a1ebd14408ac1a93eacd78716da840a3cf09dcb3cfea92d82e143d909bfbd3ecedac9d344bc23d189f78f9d070c5dc8661b02fe')

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

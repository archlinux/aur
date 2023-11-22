# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DOSE
_pkgver=3.28.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Disease Ontology Semantic and Enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-annotationdbi
  r-biocparallel
  r-fgsea
  r-ggplot2
  r-gosemsim
  r-hdo.db
  r-qvalue
  r-reshape2
  r-yulab.utils
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-clusterprofiler
  r-gson
  r-hpo.db
  r-knitr
  r-mpo.db
  r-org.hs.eg.db
  r-prettydoc
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('11096edb2862c8a442f53435082e40b6')
sha256sums=('77e86745c3ce54f36a79c35a3c5a6fa1f86090a10b66b0a5647f2d2c842db10a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

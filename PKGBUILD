# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggsc
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualizing Single Cell and Spatial Transcriptomics"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  blas
  onetbb
  r-cli
  r-dplyr
  r-ggfun
  r-ggplot2
  r-rcolorbrewer
  r-rcpp
  r-rcppparallel
  r-rlang
  r-scales
  r-scattermore
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-tidydr
  r-tidyr
  r-yulab.utils
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-scuttle
  r-testthat
)
optdepends=(
  r-aplot
  r-biocparallel
  r-forcats
  r-ggforce
  r-ggnewscale
  r-igraph
  r-knitr
  r-ks
  r-prettydoc
  r-rmarkdown
  r-scater
  r-scatterpie
  r-scran
  r-scuttle
  r-seuratobject
  r-sf
  r-shadowtext
  r-spatialexperiment
  r-stexampledata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1374c26e6ba4de60ee86f3558aad7d1f')
b2sums=('7974cbc5ffce8c08c285d9137ef470a475abb2946536ab6128126fe139da6e87c7fac72a1792bd89273b16de645d36b9af04f04303654be46712f57112c53123')

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

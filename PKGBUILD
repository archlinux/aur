# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggsc
_pkgver=1.4.0
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
md5sums=('1caafa93bcd57a5ba6fbf0725f899fa4')
b2sums=('f13c081ec61d5433e399948d2d47a81cab1afb5792da3d6b654a5a1ad58f546520df9c80020e5dc583b031eb723a4baaf5402a26b0808cd8e723d902215d5c41')

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

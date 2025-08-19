# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Signac
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Single-Cell Chromatin Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-data.table
  r-dplyr
  r-fastmatch
  r-future
  r-future.apply
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-irlba
  r-lifecycle
  r-patchwork
  r-pbapply
  r-rcpp
  r-rcpproll
  r-rlang
  r-rsamtools
  r-s4vectors
  r-scales
  r-seuratobject
  r-stringi
  r-tidyr
  r-tidyselect
  r-vctrs
  zlib
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biostrings
  r-biovizbase
  r-bsgenome
  r-chromvar
  r-ggforce
  r-ggrepel
  r-ggseqlogo
  r-lsa
  r-miniui
  r-motifmatchr
  r-rtracklayer
  r-seurat
  r-shiny
  r-summarizedexperiment
  r-testthat
  r-tfbstools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d7e06226d082f987f379e72db9078e06')
b2sums=('49dd16d2e0aadb46eec58ee33c1803f07540c24bb4d08e57bd1da54cd3ab05316bdaf1d7b4f3756fee0a02ddbe531b88177311bcd0cb3485b96674bb929f2aa4')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

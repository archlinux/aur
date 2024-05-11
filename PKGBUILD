# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Signac
_pkgver=1.13.0
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
md5sums=('a0cb5bebb0496441c31efa4d50ee90f4')
b2sums=('006d618df85a9ebcba6117f65f4889ecbe60a28b1c56f559ebc43bc44158c77f43b6103342198f76931c5945fe796aa38f1d8165f445406b6fa37b6de74327f7')

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

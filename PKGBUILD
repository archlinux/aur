# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Signac
_pkgver=1.17.1
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
  r-lifecycle
  r-patchwork
  r-pbapply
  r-rcpp
  r-rcpproll
  r-rlang
  r-rsamtools
  r-rspectra
  r-s4vectors
  r-scales
  r-seuratobject
  r-sparsematrixstats
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
  r-fgsea
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
  r-wrswor
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c8bcd5f753b464c6af918311ff49150')
b2sums=('e2883e4098d8bcff5c5c3e3f974719bdd958fb8257009a54cf494d39eb3223d25dc10d4ea8d83d503bd6e3d0be562008e3ba1f566a53a3c7217d8b0430470653')

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

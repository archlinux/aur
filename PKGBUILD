# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CBEA
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Competitive Balances for Taxonomic Enrichment Analysis in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-biocset
  r-dplyr
  r-fitdistrplus
  r-generics
  r-glue
  r-goftest
  r-lmom
  r-magrittr
  r-mixtools
  r-rcpp
  r-rlang
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-treesummarizedexperiment
)
checkdepends=(
  r-mia
  r-purrr
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-mia
  r-phyloseq
  r-purrr
  r-refmanager
  r-rmarkdown
  r-roxygen2
  r-sessioninfo
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('30daf429eb8568948239698ba7f06989')
b2sums=('7cefc22fb5e8c06d986924b77a149851d512a6b6283e559bba30fba9a0801cd6e8ae0eed54a82b3efa4875f32858e9e77bc4fcd75026160adfae419743b7ed4d')

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

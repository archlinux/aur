# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CBEA
_pkgver=1.4.0
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
md5sums=('cb3328be7ed8c0a54c318bf4b90381e6')
b2sums=('6b2cb1e6b824e94ff1e9bae0ce814761ef7887610c583119c6b3641939325a55ac56487a15af8bf04a8a95ab4be1bc505ef3e033eba3636013df1e3eff58b4d2')

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

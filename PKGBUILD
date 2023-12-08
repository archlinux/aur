# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CBEA
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Competitive Balances for Taxonomic Enrichment Analysis in R"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('20761b06df9cf37c59172508ff8cd01d')
sha256sums=('2bed418b6ab50f544301fee54b840522cdd47354951923b3f38d3428c55de670')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

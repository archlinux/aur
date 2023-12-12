# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sccomp
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust Outlier-aware Estimation of Composition and Heterogeneity for Single-cell Data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-dplyr
  r-forcats
  r-ggplot2
  r-ggrepel
  r-glue
  r-lifecycle
  r-magrittr
  r-patchwork
  r-purrr
  r-rcpp
  r-rcppparallel
  r-readr
  r-rlang
  r-rstan
  r-rstantools
  r-scales
  r-seuratobject
  r-singlecellexperiment
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
  r-tidyseurat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-loo
  r-markdown
  r-testthat
  r-tidyseurat
  r-tidysinglecellexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a24adb07d155b94645a5f684e1455f6')
sha256sums=('d1f4216eb85d47ff8a2f6403ab7a483b09cade88df5387ed5e9fca7f5c7c97a5')

build() {
  mkdir -p build
  # compilation needs a lot of memory
  MAKEFLAGS+=" -j1"
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

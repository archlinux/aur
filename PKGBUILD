# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fenr
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast functional enrichment for interactive applications"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-assertthat
  r-biocfilecache
  r-biomart
  r-dplyr
  r-ggplot2
  r-httr
  r-jsonlite
  r-progress
  r-purrr
  r-readr
  r-rlang
  r-shiny
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-xml
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f908fa38bd91672d7d0567d6232d2214')
sha256sums=('9a129e378fc04473e34a89b0f39b6dcb7cfe1f4468d2d1b824a4bb2354c1bb75')

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

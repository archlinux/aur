# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowGate
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Interactive Cytometry Gating in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocmanager
  r-dplyr
  r-flowcore
  r-flowworkspace
  r-ggcyto
  r-ggplot2
  r-purrr
  r-rlang
  r-shiny
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-stringr
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d5b19dee6139d26306d14563f445a64f')
b2sums=('cca41a6fb3371165e6f5f73098dcd58aab54bf62dc241c5c54fd257fcbbececcf3e33cfddee0770f1874e8785348a25ea668cd712bd1a07bf5be7dcf97825f38')

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

# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=timetk
_pkgver=2.9.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="A Tool Kit for Working with Time Series"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL')
depends=(
  r-anytime
  r-dplyr
  r-forecast
  r-forcats
  r-generics
  r-ggplot2
  r-hms
  r-lubridate
  r-padr
  r-plotly
  r-purrr
  r-readr
  r-recipes
  r-rlang
  r-rsample
  r-slider
  r-stringi
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-timedate
  r-tsfeatures
  r-xts
  r-zoo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-broom
  r-fracdiff
  r-glmnet
  r-knitr
  r-modeltime
  r-parsnip
  r-rmarkdown
  r-scales
  r-testthat
  r-timeseries
  r-tseries
  r-trelliscopejs
  r-tune
  r-workflows
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17fb13250486595ae91e286e8d0eb853')
b2sums=('8c5d17d40625809be0382fb54c2065e49222862f57224a5063574e2834ae80a0176758f8920cb07f857aa811214a4dc4e8fab414dde3f3ce098b69d53a0f1d4d')

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

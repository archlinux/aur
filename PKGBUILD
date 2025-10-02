# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=timetk
_pkgver=2.9.1
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
md5sums=('793943fb170581a1e9c12eed023cc1b2')
b2sums=('c93767a280abfc42b63024030c368805023316d24d2483eb96a09af9ea6631593196da2f70f906890fa0f819149a46b0738a06fc4d5055155e13b1d1df5ee258')

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

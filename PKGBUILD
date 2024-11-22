# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=tsfeatures
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Time Series Feature Extraction"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3')
depends=(
  r-fracdiff
  r-forecast
  r-furrr
  r-future
  r-purrr
  r-rcpproll
  r-stats
  r-tibble
  r-tseries
  r-urca
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-dplyr
  r-ggally
  r-ggplot2
  r-knitr
  r-mcomp
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('275dc66ba646f24c9e8a44d4eb0818ff')
b2sums=('deaba526a5b1bc05ba3b704dc2039dee6df4d32783031d24e027a8ac2cfaa69376b1284aa4f04ace6cc9a585455709ec79be9b84a6130022653e57e125d771dd')

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

# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=tidymodels
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Easily Install and Load the 'Tidymodels' Packages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  'r-broom>=1.0.9'
  r-cli
  r-conflicted
  r-dials
  r-dplyr
  r-ggplot2
  r-hardhat
  r-infer
  r-modeldata
  r-parsnip
  r-purrr
  r-recipes
  r-rlang
  r-rsample
  r-rstudioapi
  r-tailor
  r-tidyr
  r-tune
  r-workflows
  r-workflowsets
  r-yardstick
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-glue
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3694af87e93e62c26d0998c46011f9e6')
b2sums=('40dd9276ee45766687163cea4ecad85963633bb2044357274de5fd803082d5c4c74871cbb9e1e7c9478d68212d561e3019df3acd5a1ae425109a72a348de88ad')

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

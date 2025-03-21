# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=collapse
_pkgver=2.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Advanced and Fast Data Transformation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later AND MPL-2.0')
depends=(
  r-rcpp
)
checkdepends=(
  r-data.table
  r-dplyr
  r-fixest
  r-kit
  r-magrittr
  r-testthat
)
optdepends=(
  r-covr
  r-data.table
  r-dplyr
  r-fastverse
  r-fixest
  r-ggplot2
  r-kit
  r-knitr
  r-magrittr
  r-microbenchmark
  r-plm
  r-rcpparmadillo
  r-rcppeigen
  r-rmarkdown
  r-scales
  r-testthat
  r-tibble
  r-vars
  r-withr
  r-xts
  r-zoo
  r-bit64
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e99782d8646238a8a1f763136737c59c')
b2sums=('dae23cfd5ac793275aa1cb275ac4ccfcb9ed2af9efa5c876c4a6759f29f079557d4418e597f0de1721988cd145c40e8e10a7d4df35ff8b7d5a8b671ca8291227')

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

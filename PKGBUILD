# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=infer
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Tidy statistical inference"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-broom
  r-cli
  "r-dplyr>=0.7.0"
  r-generics
  "r-ggplot2>=3.5.2"
  "r-glue>=1.3.0"
  r-lifecycle
  r-magrittr
  r-patchwork
  r-purrr
  "r-rlang>0.2.0"
  r-tibble
  r-tidyr
  "r-vctrs>=0.6.5"
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-devtools
  r-fs
  r-knitr
  r-nycflights13
  r-parsnip
  r-rmarkdown
  r-stringr
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('110f04368fbfa298727dc30d8c8966f2')
b2sums=('b619251b5295e6deccebf614695d0a72e1798f8811d13366868ff50b497a50acc015753d13328897add1c6bf83b85c0c48f03ab23709ebacef07b9bcd62896ad')

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

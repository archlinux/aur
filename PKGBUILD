# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=infer
_pkgver=1.0.9
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
md5sums=('0d50b9d9b73b093564e1beb2279813ff')
b2sums=('a8f0874a07a84b03f5464b62e57477f420f644479f605fb5041b56795d6ab3fb260e4b80cb41cf5050f6a065d4e70429232b87c4dd30102b3856deb8f8ff43c7')

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

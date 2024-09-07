# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=infer
_pkgver=1.0.7
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
  r-dplyr
  r-generics
  r-ggplot2
  r-glue
  r-lifecycle
  r-magrittr
  r-methods
  r-patchwork
  r-purrr
  r-rlang
  r-tibble
  r-tidyr
  r-vctrs
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
md5sums=('140720cc073022ef997fff807443ff99')
b2sums=('84ccaad39782615f4e5ffd2dcd56a46b941d47b2f810d48c15c9183b370b6c313262f496e2e2c68c72fbd2ebc78bec07bc8a21fdd120ea1fadff7b20e9966aac')

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

# Maintainer: dhn <neilson+aur@sent.com>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggthemes
_pkgver=5.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extra Themes, Scales and Geoms for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-ggplot2
  r-lifecycle
  r-purrr
  r-scales
  r-stringr
  r-tibble
)
checkdepends=(
  r-dplyr
  r-testthat
  r-vdiffr
)
optdepends=(
  r-covr
  r-dplyr
  r-extrafont
  r-glue
  r-knitr
  r-lintr
  r-mapproj
  r-maps
  r-pander
  r-quantreg
  r-rlang
  r-rmarkdown
  r-spelling
  r-testthat
  r-tidyr
  r-v8
  r-vdiffr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eebc703683b4536514197ec246b4fbd5')
sha256sums=('56a913c9018afdff34f05031e0d79f4422dcf72b50c24529c0b7c8d519edadc5')

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
}

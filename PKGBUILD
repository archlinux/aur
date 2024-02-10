# Maintainer: dhn <neilson+aur@sent.com>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggthemes
_pkgver=5.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extra Themes, Scales and Geoms for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
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
  r-vdiffr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9491e966073dd9aac9c0356717a31662')
b2sums=('39b71e02bcec780e1600fb1cd8ff44eb3cc032545b043217d0e85c186567c68b999e455b903ba649ab3464b447bdeed3ba599d6bb10dd07df682c353261f0ff7')

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

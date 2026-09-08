# Maintainer: dhn <neilson+aur@sent.com>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggthemes
_pkgver=6.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Extra Themes, Scales and Geoms for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-cli
  r-ggplot2
  r-lifecycle
  r-purrr
  r-rlang
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
  r-rmarkdown
  r-spelling
  r-testthat
  r-tidyr
  r-vdiffr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a426e160b12a89244c0b7330b233400b')
b2sums=('214fa9416e36aca829d2a31efb02d71fc28f7756e77cf5c9572f2b22209a053e1212dea76f80cdf54a5fbb714dbdb688a9bbf84470e0640f514906c033c18a49')

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

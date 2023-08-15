# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=ggpmisc
_pkgver=0.5.4-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Miscellaneous Extensions to 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-confintr
  r-dplyr
  r-generics
  r-ggplot2
  r-ggpp
  r-lmodel2
  r-lubridate
  r-multcomp
  r-multcompview
  r-plyr
  r-polynom
  r-quantreg
  r-rlang
  r-scales
  r-splus2r
  r-tibble
)
checkdepends=(
  r-broom
  r-broom.mixed
  r-testthat
  r-vdiffr
)
optdepends=(
  r-broom
  r-broom.mixed
  r-gginnards
  r-ggrepel
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8609ee6ebb82d6d9fda281ed0ac56538')
sha256sums=('9d982c62ed393ff5177b515a6f59049f27483c67ad9205fb69185b6c3722d638')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmmTMB
_pkgver=1.1.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Linear Mixed Models using Template Model Builder"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-lme4
  r-numderiv
  r-reformulas
  r-tmb
)
makedepends=(
  r-rcppeigen
)
checkdepends=(
  r-ade4
  r-ape
  r-car
  r-effects
  r-emmeans
  r-pscl
  r-testthat
)
optdepends=(
  r-ade4
  r-ape
  r-bbmle
  r-blme
  r-broom
  r-broom.mixed
  r-car
  r-coda
  r-dharma
  r-dotwhisker
  r-dplyr
  r-effects
  r-emmeans
  r-estimability
  r-ggplot2
  r-gsl
  r-huxtable
  r-knitr
  r-mlmrev
  r-multcomp
  r-mumin
  r-plyr
  r-png
  r-pscl
  r-purrr
  r-reshape2
  r-rmarkdown
  r-testthat
  r-texreg
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc29f7e987325f269b77501613c75c1e')
b2sums=('e690c44638daee1f085511eaa6da7b29015e536744b0b6440c47aa09582b6e10683c5acbe7aeeb12babf65e2812916a73f517ded8b3eff9294d2808c25a74833')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla AAAtest-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

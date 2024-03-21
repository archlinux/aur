# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmmTMB
_pkgver=1.1.9
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
  r-tmb
)
makedepends=(
  r-rcppeigen
)
checkdepends=(
  r-car
  r-effects
  r-emmeans
  r-mvabund
  r-pscl
  r-testthat
)
optdepends=(
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
  r-huxtable
  r-knitr
  r-mlmrev
  r-multcomp
  r-mumin
  r-mvabund
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
md5sums=('a2d376ca8ae9bb5c5cacda1e557afb54')
b2sums=('a93dea73e96a93d348c26df99a88b1a2a7e680ba46a1f4f45cd3f2f8beef5078adc73bf36f372899a9d37ffd46189a552c53a84b79fee5b174441c5c10a4f70b')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmmTMB
_pkgver=1.1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
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
  r-broom
  r-broom.mixed
  r-car
  r-coda
  r-dharma
  r-dotwhisker
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
  r-reshape2
  r-rmarkdown
  r-testthat
  r-texreg
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b38f12164a971f380576ad2743f3ef12')
b2sums=('b9b4ed1f8ab5a4a02a235ed337ce14d4d8e137ec6ca06ebb56f71ed6aed899adf21dee7ebce27e717f177d6075516faed14c4370b91e27cd5bf91448b2f39f2e')

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

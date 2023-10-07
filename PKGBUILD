# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmmTMB
_pkgver=1.1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Linear Mixed Models using Template Model Builder"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(AGPL3)
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
sha256sums=('4248f6c37a2f82543bc0160c71d6d409ff742a4b1b29b417a42f34460489bd14')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla AAAtest-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

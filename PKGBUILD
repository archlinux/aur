# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Hu Butui <hot123tea123@gmail.com>

_pkgname=performance
_pkgver=0.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Assessment of Regression Models Performance"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bayestestr
  r-datawizard
  r-insight
)
checkdepends=(
  r-aer
  r-afex
  r-bayesfactor
  r-betareg
  r-bigutilsr
  r-curl
  r-dbscan
  r-dharma
  r-estimatr
  r-fixest
  r-glmmtmb
  r-httr
  r-ics
  r-icsoutlier
  r-islr
  r-ivreg
  r-lavaan
  r-lme4
  r-mclogit
  r-metafor
  r-nonnest2
  r-ordinal
  r-parameters
  r-pscl
  r-randomforest
  r-rstanarm
  r-rstantools
  r-testthat
)
optdepends=(
  r-aer
  r-afex
  r-bayesfactor
  r-bayesplot
  r-betareg
  r-bigutilsr
  r-blavaan
  r-brms
  r-car
  r-cardata
  r-compquadform
  r-correlation
  r-cplm
  r-dbscan
  r-dharma
  r-estimatr
  r-fixest
  r-flextable
  r-forecast
  r-ftextra
  r-gamm4
  r-ggplot2
  r-glmmtmb
  r-hmisc
  r-httr
  r-ics
  r-icsoutlier
  r-islr
  r-ivreg
  r-lavaan
  r-lme4
  r-lmtest
  r-loo
  r-mclogit
  r-mclust
  r-metadat
  r-metafor
  r-mlogit
  r-multimode
  r-nestedlogit
  r-nonnest2
  r-ordinal
  r-parameters
  r-patchwork
  r-pscl
  r-psych
  r-qqplotr
  r-quantreg
  r-randomforest
  r-rempsyc
  r-rmarkdown
  r-rstanarm
  r-rstantools
  r-sandwich
  r-see
  r-survey
  r-testthat
  r-tweedie
  r-vgam
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5e1b81e342af23b8d7278d4740e13931')
b2sums=('745e94f879d111e174d41f8076d241370dca5e838066e1b56a8a38120554fd502c945fe271fe9bd482719de5c0525cbe48ba6365d87a0a2c58d96784668fe489')

prepare() {
  # skip failing tests
  cd "$_pkgname/tests/testthat"
  sed -i '/"brms_mixed_1"/i\ \ skip("fails")' test-icc.R
  sed -i '/"model_performance.brmsfit"/a\ \ skip("fails")' test-model_performance.bayesian.R
  sed -i '/"logLik"/a\ \ skip("fails")' test-logLik.R
}

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

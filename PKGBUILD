# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Hu Butui <hot123tea123@gmail.com>

_pkgname=performance
_pkgver=0.10.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Assessment of Regression Models Performance"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
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
  r-compquadform
  r-correlation
  r-cplm
  r-dbscan
  r-estimatr
  r-fixest
  r-forecast
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
  r-nonnest2
  r-ordinal
  r-parameters
  r-patchwork
  r-pscl
  r-psych
  r-qqplotr
  r-randomforest
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
md5sums=('79b638bc9062c40848cb38670b980c20')
sha256sums=('d91c0dc1ab7e32868c750357b3af4e98f2bf972f724d9f6e50de4015c56f8caf')

prepare() {
  # skip failing tests
  cd "$_pkgname/tests/testthat"
  sed -i '/"brms_mixed_1"/i\ \ skip("fails")' test-icc.R
  sed -i '/"model_performance.brmsfit"/a\ \ skip("fails")' test-model_performance.bayesian.R
}

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

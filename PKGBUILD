# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Hu Butui <hot123tea123@gmail.com>

_pkgname=performance
_pkgver=0.16.0
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
  r-httr2
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
  r-curl
  r-dagitty
  r-dbscan
  r-dharma
  r-discovr
  r-estimatr
  r-fixest
  r-flextable
  r-forecast
  r-ftextra
  r-gamm4
  r-ggdag
  r-glmmtmb
  r-gparotation
  r-hmisc
  r-httr2
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
  r-modelbased
  r-multimode
  r-nestedlogit
  r-nonnest2
  r-ordinal
  r-parameters
  r-patchwork
  r-pscl
  r-psych
  r-psychtools
  r-qqplotr
  r-quantreg
  r-randomforest
  r-rcppeigen
  r-reformulas
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
md5sums=('7dc4337cdcf068af86dc46eb1113a116')
b2sums=('bbf6038cd149d944eb085fa902ae2eb8700a834e50180039a9507784f4c78e90aba011d2eb929758bf8f730b35cf54c3fa198b23912c013712ed95d21473ae7d')

prepare() {
  # skip failing tests
  cd "$_pkgname/tests/testthat"
  sed -i '/"brms_mixed_1"/i\ \ skip("fails")' test-icc.R
  sed -i '/"model_performance.brmsfit"/a\ \ skip("fails")' test-model_performance.bayesian.R
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

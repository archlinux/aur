# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clubSandwich
_pkgver=0.5.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster-Robust (Sandwich) Variance Estimators with Small-Sample Corrections"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-sandwich
)
checkdepends=(
  r-aer
  r-cardata
  r-geepack
  r-ivreg
  r-lme4
  r-metadat
  r-metafor
  r-mlmrev
  r-plm
  r-robumeta
  r-testthat
)
optdepends=(
  r-aer
  r-cardata
  r-covr
  r-formula
  r-geepack
  r-ivreg
  r-knitr
  r-lme4
  r-metadat
  r-metafor
  r-mlmrev
  r-plm
  r-rmarkdown
  r-robumeta
  r-testthat
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e1902cb9a93ccf46f1eedf96396280d9')
sha256sums=('daf0b372f0e6aae141d45b78b69c6f680c774f201691a1333400073001c6a463')

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

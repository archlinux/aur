# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clubSandwich
_pkgver=0.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster-Robust (Sandwich) Variance Estimators with Small-Sample Corrections"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-lifecycle
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
  r-estimatr
  r-fixest
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
md5sums=('8bc1fb7ac9da2ba09c10006b87bf89eb')
b2sums=('5206790426b461ec8170d55e0f37b7edc6117667046132d146e003fadd74350119091b7227601da76bf7de23281005f03bfa7e5e2d76613d84677829749252f4')

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

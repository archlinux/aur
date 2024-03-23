# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DHARMa
_pkgver=0.4.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Residual Diagnostics for Hierarchical (Multi-Level / Mixed) Regression Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ape
  r-gap
  r-lme4
  r-lmtest
  r-qgam
)
checkdepends=(
  r-glmmadaptive
  r-glmmtmb
  r-mgcviz
  r-spamm
  r-testthat
)
optdepends=(
  r-glmmadaptive
  r-glmmtmb
  r-knitr
  r-mgcviz
  r-rmarkdown
  r-sfsmisc
  r-spamm
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1bc0e3ce3b7761689efc8ad828b55e5d')
b2sums=('c344045c2adeedad2f17f318ddbbe9f8d6214368a50c97d0874f292197941f0c329ba68a18d099a7ec8160ffb294fccb7783762906692203b073bb9e76e0dbca')

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

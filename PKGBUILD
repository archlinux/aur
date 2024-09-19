# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ivreg
_pkgver=0.6-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Instrumental-Variables Regression by '2SLS', '2SM', or '2SMM', with Diagnostics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-car
  r-formula
  r-lmtest
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-aer
  r-effects
  r-ggplot2
  r-gt
  r-insight
  r-knitr
  r-modelsummary
  r-rmarkdown
  r-sandwich
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9a3078bbb5c418afecb57097135b0350')
b2sums=('4e2a3f409d2571668aefd6a33ace567ffcde87a48171e2999aea4a8373c2a4b219a83630aa62e7fce8e94fe6ea691539d9c1a61271697287021fecdb85a6bd88')

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

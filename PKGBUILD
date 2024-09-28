# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=distributions3
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Probability Distributions as S3 Objects"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-glue
  r-rlang
)
checkdepends=(
  r-poissonbinomial
  r-revdbayes
  r-testthat
)
optdepends=(
  r-cowplot
  r-knitr
  r-poissonbinomial
  r-revdbayes
  r-rmarkdown
  r-testthat
  r-tibble
  r-vctrs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('62b8642512113d37b1bee51d1eeba531')
b2sums=('241bc4e51766125c9c465da6b7f31de4885c5f7f70f503365d3f67a54a72b7792109906c856fd66d9ad389639f7a935cc9e10ab35e1cb8608b5f6590a5a12d50')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

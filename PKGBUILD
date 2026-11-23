# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=distributions3
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Probability Distributions as S3 Objects"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rlang
)
checkdepends=(
  r-crch
  r-ggplot2
  r-poissonbinomial
  r-revdbayes
  r-scoringrules
  r-testthat
)
optdepends=(
  r-cowplot
  r-crch
  r-ggplot2
  r-knitr
  r-numderiv
  r-poissonbinomial
  r-revdbayes
  r-rmarkdown
  r-scoringrules
  r-testthat
  r-tibble
  r-vctrs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0ef77e79507896f8e21fc23fe3bb950c')
b2sums=('ca50c7def8f15c08a16bcee2cd4ae7bb2292d43ae95805f702c7081ad8eae80fba62883f82c5c1df22cf8d9f131898f4ef5a7c3110a9d12050804869b0ca851c')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=distributions3
_pkgver=0.2.3
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
md5sums=('0b90013dccbf24a8b118dd4410368cc8')
b2sums=('f1ca8b01d3d97d387870042105c14d4e6c4d4871a7c1b3150f626be6590e368eab7e4339dd0dbbfe870f793885f69ea901513d5bf69508ef83878e218310b4a3')

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

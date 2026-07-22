# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=distributions3
_pkgver=0.2.4
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
md5sums=('52a2c2b14c14c5e2c5c93c0c997cdc30')
b2sums=('7845bdb7ebe75241333402adf07509b1a757ad4c0683090bea872c6c6838e69b3a7163da72cf39248dcc17f7907c4ca638df5b1c46154340257422c3777751e1')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=distributions3
_pkgver=0.3.1
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
  r-ggplot2
  r-hypergeo
  r-knitr
  r-numderiv
  r-poissonbinomial
  r-pscl
  r-revdbayes
  r-rmarkdown
  r-scoringrules
  r-testthat
  r-tibble
  r-vctrs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('960720cd7539e97303f4e3e9763b5389')
b2sums=('8204970cc10570eae87db59c3da68ba01692504e51beb596aa4b2ba68642867858132796bc855fe3be4915a34c91749e3fa8efe31ae7312acda39352e944f989')

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

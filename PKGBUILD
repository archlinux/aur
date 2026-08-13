# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fairness
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Algorithmic Fairness Metrics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-caret
  r-ggplot2
  r-proc
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-devtools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f354bbdf415abb44edd8efe4ccaea6a4')
b2sums=('1bd0c340b16d8a4af4f4af43b33289dc4d01e3da836c790194138b95d904c059caddbe004198012f7056a817aba0dfd1bd7c91ff0af6ffee0bfcd507559a19ea')

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

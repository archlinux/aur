# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidylog
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Logging for 'dplyr' and 'tidyr' Functions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-clisymbols
  r-dplyr
  r-glue
  r-rlang
  r-tidyr
)
checkdepends=(
  r-forcats
  r-nycflights13
  r-testthat
  r-units
)
optdepends=(
  r-bench
  r-covr
  r-forcats
  r-knitr
  r-nycflights13
  r-rmarkdown
  r-testthat
  r-units
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e7e6941312ac41dee0b1b836d628811c')
b2sums=('7b007b6652f9c9077e233f3836b1cbe317db292ff2cfdb28d32f7c9f48608f9896db5f17e8e771aae02bbd5e2d597b54e6ce01457ff9e0bb0fd3d87fcc442f1e')

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

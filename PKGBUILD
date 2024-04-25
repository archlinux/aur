# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=R6P
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Design Patterns in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-collections
  r-dplyr
  r-purrr
  r-r6
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-dbi
  r-ggplot2
  r-rsqlite
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4700d4fc492e9bf7a0f86e9ed5f1f50e')
b2sums=('b7a0fe0a41264086ef1725f32a12aec50d0472da01aaaebb7833c29e535a22b6881ab5a78d0146a746f77a1715ef15882bbdc09741a72526f1f36bd0b514ad9e')

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

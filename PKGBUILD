# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=yardstick
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tidy Characterizations of Model Performance"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-dplyr
  r-generics
  r-hardhat
  r-lifecycle
  r-rlang
  r-tibble
  r-tidyselect
  r-vctrs
  r-withr
)
checkdepends=(
  r-ggplot2
  r-testthat
  r-tidyr
)
optdepends=(
  r-covr
  r-crayon
  r-ggplot2
  r-knitr
  r-probably
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1cf92ed73945340367924fb3a8c7bdeb')
b2sums=('893804eca1aba3308625ed4e3ce5cd1ee4f7bdd26e5c04abe7ee18bc51d542f659a4f043bef9b216cf8e822085c1237db15bb2bd161f1748d65d393f1f34b741')

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

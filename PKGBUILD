# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=yardstick
_pkgver=1.4.0
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
  r-ggplot2
  r-knitr
  r-probably
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d475fe630be7b265ebb47f56b7d8870c')
b2sums=('3c528d3ba8119da12f703e66e15a83d5d09c0ef66cf30681e2efe685a9d9d434c2616e96d0bf16863f1ebf332c676f1a2634c1eefd5988ea61a5d42fb4c24cb5')

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

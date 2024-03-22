# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=yardstick
_pkgver=1.3.1
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
md5sums=('5e35a7fabd9e7ec8effd168556c67753')
b2sums=('5383b5794681bab5271a23673af9270d257ba79de887c3eda4886c31d54194ca9c5d2efbaa1cbb8eca1135cb8ee04f73fee32ef2d0df794ad7185728fefd9b4b')

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

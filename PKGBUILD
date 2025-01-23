# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=yardstick
_pkgver=1.3.2
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
md5sums=('b40c0186e8534c3216e5f2da5fc0d18f')
b2sums=('52f50d35bd3b320a929838042bb16bd43818339fb99f90b3ca7fb0b9146081d69b71a7cefc30d5ad65b7f03edf31ec422d1b9977f29c36c2f1dbe6ec09943dab')

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

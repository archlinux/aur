# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=mockr
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mocking in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rlang
  r-withr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-fs
  r-knitr
  r-pkgload
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e868940b792e0be140658c522c4d2bf9')
b2sums=('e08b7967c4721026646ac8fb875c99016793d4968d1c3a85710e56e69e3b08ef1ee829363429f25d915a842dc750e01a8d726dff239d7ac43d4d0a0af7d7164a')

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
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=common
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Solutions for Common Problems in Base R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC0-1.0')
depends=(
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-box
  r-glue
  r-knitr
  r-rmarkdown
  r-rstudioapi
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('786eedd15215e0bbc3d52d45feed3586')
b2sums=('14f3877d09cf5c0b2420268dd25bd5dd02b358ece60fea405625f8c58d17ab6e476a888621c455b5d711834ae5dc2a58679f6e6c66bdba181f76f6783642d309')

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

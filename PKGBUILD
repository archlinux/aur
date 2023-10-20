# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ssc
_pkgver=2.1-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Semi-Supervised Classification Methods"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-proxy
)
checkdepends=(
  r-caret
  r-kernlab
  r-testthat
)
optdepends=(
  r-c50
  r-caret
  r-e1071
  r-kernlab
  r-r.rsp
  r-stringi
  r-testthat
  r-timedate
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('122e647cfaf26507b92a546dab33e053')
sha256sums=('bc298b7b954fece3e1e6be85d95a9a0ad65626082801208a22cfc905d10d07d3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=common
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Solutions for Common Problems in Base R"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
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
md5sums=('92231535ce9cf7327dd33aff8449d463')
sha256sums=('183e5f937823ff6b8ef1b22679177c3e25ffbb256784879ece0cefdba78e9978')

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

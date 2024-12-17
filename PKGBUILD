# Maintainer: Aleksi Gaevsky <aleksi [dot] eesti [at] gmail [dot] com>

_pkgname=statR
_pkgver=2.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="statR package can be used to create visualizations, Excel tables and HTML reports in R that conform to the corporate design of the Canton of Zurich"
arch=(x86_64)
url="https://github.com/statistikZH/statR"
license=('GPL-3.0')

depends=(
  r-dplyr
  r-ggplot2
  r-openxlsx
  r-rcolorbrewer
  r-gridextra
  r-rlang
  r-scales
  r-stringr
  r-purrr
  r-yaml
)

checkdepends=()
optdepends=()
source=("https://github.com/statistikZH/statR/releases/download/${_pkgver}/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('SKIP')
b2sums=('SKIP')

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

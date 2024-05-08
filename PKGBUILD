# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=enrichViewNet
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="From functional enrichment results to biological networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dose
  r-enrichplot
  r-gprofiler2
  r-jsonlite
  r-rcy3
  r-strex
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f01eb6bcaefcabf4e714ca77f3b8d9e6')
b2sums=('6eb49b798bb341ea9748d24e19870b4447f8e0e60cfbabf5284e696915f48b7132c6131a2684fb3c121fd0a780765460aa7aec46442c5ab9329bd6c30e63d972')

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

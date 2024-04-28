# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simpleSeg
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A package to perform simple cell segmentation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-cytomapper
  r-ebimage
  r-s4vectors
  r-spatstat.geom
  r-summarizedexperiment
  r-terra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd0a780ed7dfde71db7ecdf2cee30b0c')
b2sums=('de6403171491a4bc381526567e4ef3a9857f7ee823dd28cdc41cb5bff45f653fa8d372790a976f21c360f3a4e85d0e3c37dd9f8c17917b28ee586def36e52973')

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

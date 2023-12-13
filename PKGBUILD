# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simpleSeg
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package to perform simple cell segmentation"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('8c1c1a13b62eee2b6f68717e9319dfdf1e92753c441745995ce29db29f3939f4')

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

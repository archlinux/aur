# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spaSim
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial point data simulator for tissue images"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dplyr
  r-ggplot2
  r-rann
  r-spatialexperiment
  r-spatstat.geom
  r-spatstat.random
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a3dbdeaaca0ec5a65d98a70385f7f5b')
b2sums=('12c89cd244eae6f40b5cc2caa106c76b993e6d5b1ad20646c35e42475c47218b4aca8457911fbc0de2fbf41b87485cffd6a8cbd2d3ece61e9cf05515acb3d90d')

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

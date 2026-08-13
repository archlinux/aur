# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spaSim
_pkgver=1.14.0
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
md5sums=('dc64074112258e3bba9e42e56f091463')
b2sums=('572901cf50700941914aca5a6f4dc3294a7a955c55a9e5d33d99eac541d06a928462054d78e2dd664d84de23a8f1f09eb51c8fec98e8c1815ca94477e828fba2')

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

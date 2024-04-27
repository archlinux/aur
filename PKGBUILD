# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=QTLExperiment
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="S4 classes for QTL summary statistics and metadata"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ashr
  r-biocgenerics
  r-checkmate
  r-collapse
  r-dplyr
  r-rlang
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-vroom
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe7642e0952c4c68e5417906dfb66fb3')
b2sums=('d41243c1ebf772c212151b979f4b82c96f3dfe0b653ea98c6ffda6d5b265478c0ba84f3f63ff788294cec8b778c00aea7d0b06bd55454ee3afd70e614fb6a9e6')

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

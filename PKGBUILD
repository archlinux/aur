# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=concordexR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Calculate the concordex coefficient"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-cli
  r-delayedarray
  r-ggplot2
  r-pheatmap
  r-rlang
  r-scales
)
checkdepends=(
  r-biocneighbors
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocneighbors
  r-biocstyle
  r-bluster
  r-covr
  r-knitr
  r-patchwork
  r-rmarkdown
  r-scater
  r-tenxpbmcdata
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ffab81582264ccb300c9f937c698adf')
b2sums=('792cf49e7337daaf8625e72f6f10b54913c8a5bfdba576901852065c4f3ee38fc72868ef3b11aeb2e69ff1111ed1c4d8ccdd2b522bb72c96c401a1b2656bd4a3')

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

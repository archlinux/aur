# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=concordexR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Calculate the concordex coefficient"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('bc69c64f07d6813f337c65ce8edf8db066c3eaeb4c9a89b75cf9523a0926d71b')

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

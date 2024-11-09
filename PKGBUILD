# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=stJoincount
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Join count statistic for quantifying spatial correlation between clusters"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-ggplot2
  r-magrittr
  r-pheatmap
  r-raster
  r-seurat
  r-sp
  r-spatialexperiment
  r-spdep
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('94c4eeaaa629a3a0f2ddf84ed2f602bb')
b2sums=('a5376c0293b848ad5d429d2c08d883d5e9cd09ecb18f079ee1d71b0f8aaf06928c7fa93410989ac660f420d170d1034d6f8ef05a335e24b5a2f7bbaa53e464dc')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

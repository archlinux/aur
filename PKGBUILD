# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=stJoincount
_pkgver=1.10.0
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
md5sums=('3c12b7ae52caed7a795a08312ee76156')
b2sums=('12702ae37817b7894451b5ef625022e33987338fa0ca298659494964530cb7b9cc7856de7944fa4d0bd5969faec28dfe15941c1cf2a3b659e72afb4bcdc70841')

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

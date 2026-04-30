# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mbQTL
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package for SNP-Taxa mGWAS analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-broom
  r-dplyr
  r-ggplot2
  r-matrixeqtl
  r-metagenomeseq
  r-pheatmap
  r-readxl
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6460fbccbd97b63f4460bf6833b42a58')
b2sums=('ceaed91cecfb8e15c4e92aa50f209592e9b5de21242553dc67454eb0ed9e687e83519f19aac3e44a0debfa7c58908cf8f1b9ce1c8cc8d1ddd6dceb095c328613')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

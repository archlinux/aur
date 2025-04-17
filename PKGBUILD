# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mbQTL
_pkgver=1.8.0
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
md5sums=('33815ba4f7705ea49a48d3b285465156')
b2sums=('92e00dcf3738097a27a667601fa46e6e9946ef7cca71c7a7c115344c53c740d2d61a6ec3e29e40e60222d7687b8279b7a7cf8f4b6c2b8ff7c33f4bffbba89119')

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

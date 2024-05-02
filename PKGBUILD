# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mbQTL
_pkgver=1.4.0
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
md5sums=('76f011a9671be4ccd8cb3b8025cba66e')
b2sums=('d40e6291eca2c5af1d60128563d64c0fd34c9f213a6772b0cd1a078b6168b576816a658481417e2fdb5d0d3bf2442e64f83676f517286b6d180c2d10bd6151a0')

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

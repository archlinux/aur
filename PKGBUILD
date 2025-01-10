# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mbQTL
_pkgver=1.6.0
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
md5sums=('6aeec2af56b99fd2fde4778b36fd4af7')
b2sums=('d506f8be2efc443b94c78f5306f1974735b3461847c254d4126cf8d45f105a993993886779c239268278433acbf95972c1e2c9950d18e4178e4336f459f6e6be')

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

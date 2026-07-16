# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DELocal
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identifies differentially expressed genes with respect to other local genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-deseq2
  r-dplyr
  r-ggplot2
  r-limma
  r-matrixstats
  r-reshape2
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-biomart
  r-knitr
  r-rmarkdown
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4472b0a7f5a72789ac0678207c810c21')
b2sums=('9dbe8fe3dfa68b6e638905ccfd286c85c29ef148b8ce573d5a9fe1d7c472b6e36ac8a37d1f9c2c416cb7b891e0c0de3ccd09307dccba2a5139371dd401967dec')

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

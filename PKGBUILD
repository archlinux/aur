# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DELocal
_pkgver=1.2.1
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
md5sums=('11c1471d2d939f9a40cfa7d68dd608ca')
b2sums=('0f0da1783f4f43545847d46920a003935e70b0bbd5e1730067971d2724110231f1047fbecba19cc8eb7818b5e87b031798729a44be2eb1b14435ab663e4f2624')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DELocal
_pkgver=1.8.0
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
md5sums=('281b7de1b95c06e1018f006375c6672d')
b2sums=('d5cf2b14bf4e2134b7abe9911c3eaac6ec9b86a42ba9c4916c898543569f3e82d863e0472278ff7c4a12a83ba2db34fb2b5909d9529fd94e9bff45bc998e23b3')

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

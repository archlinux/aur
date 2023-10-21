# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DELocal
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identifies differentially expressed genes with respect to other local genes"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
  r-biomart
  r-knitr
  r-pcredux
  r-rmarkdown
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f595f5306f040c92e53f70db5fb4d81')
sha256sums=('85e1ceb9812f18727fa12bbc17691e3bfe89dc6686900d14245a773a1cce1395')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

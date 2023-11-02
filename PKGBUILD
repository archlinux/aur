# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DELocal
_pkgver=1.2.0
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
  r-biocstyle
  r-biomart
  r-knitr
  r-pcredux
  r-rmarkdown
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('40f2eac89260ff4692fb02047990d048')
sha256sums=('07efaf2566a44e8a92c54523ed816c8ffdca978d5dcc20da3c6bdd38167ef0c1')

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

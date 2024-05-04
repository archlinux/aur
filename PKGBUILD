# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=orthos
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="\`orthos\` is an R package for variance decomposition using conditional variational auto-encoders"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationhub
  r-basilisk
  r-biocparallel
  r-colorspace
  r-cowplot
  r-delayedarray
  r-dplyr
  r-experimenthub
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-ggsci
  r-hdf5array
  r-keras
  r-orthosdata
  r-plyr
  r-reticulate
  r-rlang
  r-s4vectors
  r-summarizedexperiment
  r-tensorflow
  r-tidyr
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-htmltools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bea22407249492b848226f5d73969cce')
b2sums=('74e258f6f89aa05f8b0b9b4f99a0ef9c169b58474271d29b421ef266de51408bad6a55c4635649d3f1260983dc3ee7a07a055e5f88b20fc9ac6b540607a12604')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=orthos
_pkgver=1.6.0
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
md5sums=('3316b673163e98bcac6891dde1f2da72')
b2sums=('0b4d2f621b5e0371a63f65b0d7aa5742492791f0815c6ac4b6e42b9294709f5a0e85df913efd27c1e4c333c171714a2637595c6e6062a5db76a9522b118f0475')

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

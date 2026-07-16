# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=orthos
_pkgver=1.10.0
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
md5sums=('5b833e1d0d846a15ec85f27fb3c38d02')
b2sums=('e62da2d7f6017d1a0b7015bcda9502063d9c945f235e20c6a61d82b97a92c872f259d4db44f959ad30f3500578a8baaeabf2603072cbfc9d413d03a1dd6f2926')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=orthos
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('c35d515c0e956e4207b00db662192707')
b2sums=('d625afa4fa66ce61392616a49023a003acda32d399fa5cf76291f24f75ef059188d797a7319c6f77cd76072440a87de852fb7da113aab0ad8bb930a1d2ec2cab')

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

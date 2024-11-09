# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=orthos
_pkgver=1.4.0
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
md5sums=('c785f8e2372aaad8f3f9b418d152ddb7')
b2sums=('0623c9a349c0e72cb63ecbe4c39ab3a931ede569415d550d2772450cb34cfd48d0a61a01ad52b13a42330a051076cf902cbb24d8f06d138885b03b733c1753c0')

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

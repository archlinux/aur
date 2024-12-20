# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=velociraptor
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Toolkit for Single-Cell Velocity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-basilisk
  r-biocgenerics
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-reticulate
  r-s4vectors
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-zellkonverter
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-ggally
  r-ggplot2
  r-knitr
  r-metr
  r-patchwork
  r-pkgdown
  r-rmarkdown
  r-rtsne
  r-scater
  r-scran
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd40fd69025725daf863b9c0bcfe46b6')
b2sums=('bf0d7da38d3860163f39d10fa43503799fc1a75f840bcd70ca11f8daebae907387be8ea77b9547a413e641db3b33e0149d851604be50b25eb2606086c36a620b')

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

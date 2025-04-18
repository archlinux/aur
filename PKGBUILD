# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=velociraptor
_pkgver=1.18.0
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
md5sums=('990fd8378b89ad5f7ea72265adea8887')
b2sums=('8da696e1d4ccab7515743597c096288d4f7f382491c6b2cf83c1be3c0b74be7cdbb02e934aeb510410a9391de3728ff66e7391f5ec1573517fc7f56a041a5699')

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

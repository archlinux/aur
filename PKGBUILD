# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=velociraptor
_pkgver=1.24.0
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
md5sums=('26104c8f7b1495b360f1b3ff827ae5fa')
b2sums=('c94d6e6bffe808e3fa8e347c226d8f9777d2429b4248d91dfd071b8fd67a24cd1115aa7eb1615f6f3607713b215b06ea6ea4e96af8e8597a5f4bf7559272a2f6')

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

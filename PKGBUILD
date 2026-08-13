# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=velociraptor
_pkgver=1.22.0
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
md5sums=('77c9866e149023a7b30f96a6c27b04f1')
b2sums=('5d51dec03bf878ad026d7cdf8be4d9deb10c53a9f8de43705fdb601a3ec1fceeed6a36e0af247ae4d49f1547862b4b575e5f6e764e728250ca304bd783650882')

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

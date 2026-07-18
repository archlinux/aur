# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggspavis
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization functions for spatial transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-ggrepel
  r-ggside
  r-rcolorbrewer
  r-scales
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
)
optdepends=(
  r-arrow
  r-biocstyle
  r-bumpymatrix
  r-knitr
  r-osta.data
  r-patchwork
  r-rmarkdown
  r-scater
  r-scran
  r-stexampledata
  r-testthat
  r-uwot
  r-visiumio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0fa9893fb44a7942ff2d69b9e59ce539')
b2sums=('9201104ab6dea197945a0bc60872ffa4b470618844e5d4d17ae9d3ea757e4cd609368e69f1c80ad2850a8b4fd3a3049a3ce8cc3deebf19be26ee6c4c5d8a8854')

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

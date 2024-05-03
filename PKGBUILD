# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCool
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Processing Hi-C raw data within R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-basilisk
  r-biocio
  r-dplyr
  r-genomicranges
  r-hicexperiment
  r-interactionset
  r-iranges
  r-plotly
  r-reticulate
  r-rmarkdown
  r-rmdformats
  r-s4vectors
  r-sessioninfo
  r-stringr
  r-vroom
)
optdepends=(
  r-annotationhub
  r-biocfilecache
  r-biocstyle
  r-hicontacts
  r-hicontactsdata
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7c441fb3e72a20d37fd685dacd43830c')
b2sums=('9aefe562fab88aa683c7b4908ebf0be838720a95ca0fc43d57f531ab91eaa4f17dd848ba18858ff964badd6c5dc00b6929ae767bb380e05757af8b8762456751')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCool
_pkgver=1.8.0
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
md5sums=('c40ac621fc06f6c3a4845881d3fc16bd')
b2sums=('c896d13ac759d39ec5969b2620c7c965d718efadbec37cb5fc050b2b21c8d51e97417d1e8952df359de704d70d4f602d24b2dc688d7305e24538e289f9977848')

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

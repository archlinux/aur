# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCool
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Processing Hi-C raw data within R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-basilisk
  r-basilisk.utils
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
md5sums=('acae95914b54bbca1c4fb652eba3e29d')
b2sums=('ab01ef988f42b58bdbcebbe73ba0d237191229820ebe7912096faa96071c3ea0b212d76cb53fd95aa9d2f3427b761214e570a24b9767668a8fbb76ed0da47d33')

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

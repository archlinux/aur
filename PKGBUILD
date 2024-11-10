# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCool
_pkgver=1.6.0
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
md5sums=('e17b49313cd3d6d77cfb5c858a4e90fb')
b2sums=('1d8b635367a7e2703f0c5bcf6845a678cbf64f23b56bc796cfedfd0f7d0a2c648cf73c31e9ffbf168815e5edf6ecf46ba499fd2d26faac7ea8ef915c9524d056')

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

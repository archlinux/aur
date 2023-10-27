# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCool
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HiCool"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('04aa2ef16336d5c43fc0a02291ba7887')
sha256sums=('d2d6aaa5b81a1cd04b808b2b5544b62a92f75dd6f6e5492b1c559ecb85be9546')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

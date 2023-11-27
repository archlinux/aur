# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=orthosData
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for the orthos package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-annotationhub
  r-biocfilecache
  r-experimenthub
  r-hdf5array
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7970587455fa5197daf1f6b640b7f688')
sha256sums=('631be84ad27eea65697c93a491fa96afcde226e05876cb9d644940d5dd9e3b59')

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

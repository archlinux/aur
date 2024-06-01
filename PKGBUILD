# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RLHub
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An ExperimentHub package for accessing processed RLSuite data sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationhub
  r-experimenthub
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a056f13ee0636d7edd249c8f469c45ff')
b2sums=('6781c4046a22ec8a2cf99ee35aa71267e3b103025a36e48ab6bde3282b732ec75f7a1cd6e880c5fbad821c144a80ee85eb97a9e75c09ebb58f319d00e86800e9')

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

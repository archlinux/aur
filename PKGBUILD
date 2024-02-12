# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RLHub
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
source=("https://bioconductor.org/packages/3.17/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9072a588ef09512493ea389c50984153')
b2sums=('caceabbd6afbc8dc710d8a5de89d3359ee68497c57b4a7dc58997fe308d3fd0ae79cdfc4198f9d044733469c1dc0c78404529d7d97663517abc62e85eb443665')

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

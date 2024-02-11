# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparseDOSSA
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Sparse Data Observations for Simulating Synthetic Abundance"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-mcmcpack
  r-optparse
  r-tmvtnorm
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb988cd435f5c6da0b103632ef1deb50')
b2sums=('d3ced3197e899c7d4dd9a21b6fd10903634b8950983cf93f6cb9e2bb910839d7ad628ff233d2ea8e4fdf110ebb2466450313fdc18f017af8edc2ea6af7fc7c7d')

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

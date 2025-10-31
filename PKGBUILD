# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccrepe
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ccrepe_and_nc.score"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-infotheo
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e6813875af675cc311f1048dc8dcfbc7')
b2sums=('6fc5a142bdbd2a3e6725ff7a0ace88aecbfb93b3c7c16d8c3ab2fc75652f67c991c85a68de571d49f9a90d3de037b08979bba9e7e69cc2af6a2e54bc43795856')

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

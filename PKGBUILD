# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccrepe
_pkgver=1.40.0
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
md5sums=('42bea79b9211bc70929af3bd5cb75fe5')
b2sums=('801b0f28b05296db895dac3d2dd9440ec3787ad1ceed5cce1e7bb0165c49846052ee4e73b9dc1e84e3ed5fab124e955e3e9d5c320eb2adbc76ae205395bd5579')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=assorthead
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Assorted Header-Only C++ Libraries"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa08d774cd62ced76fe5cce39c2d7d9e')
b2sums=('f5e4901dfdddc17b8af905f9f9999fba05e6321d673ac5b4eeac9ce20a8bc288efa919ffb81990c21301c0e9650606bbd37861b2c18d59f1ced268435c838304')

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

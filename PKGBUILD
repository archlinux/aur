# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epimutacionsData
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for epimutacions package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-experimenthub
  r-knitr
  r-minfi
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9ee221170abbec10af2665d47d78a18')
b2sums=('a1eceef06cc0f358caed59143dbbfb84dad25a7f9a3d4eef0cad7e309f350ea2bbf32846387d465101a0f97f86481cce8402aa755e2cff13ced25abad1eabe79')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epimutacionsData
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('e2681ab8096fd0f2b7e5d8ed68928280')
b2sums=('eebaa880975a38d5628d703a20df6084cd82db864097b4d3fbe9120690dbebc41bea0455106fbb95a42f9be9550d47b18e1fbb19b5efc0cd22de4f6184f3c30d')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=epimutacionsData
_pkgver=1.12.0
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
md5sums=('a0994b1b960b9616af7cc133efc5bd6b')
b2sums=('6770d68b1a79667e1abdf49a611b0b90dc44ffc3abccddab47113828bc154b93d506b9a3b5c1ab99980cf785a194bcdb64c16d8a279285078c8cccf7806c7f51')

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

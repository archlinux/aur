# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=assorthead
_pkgver=1.8.0
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
md5sums=('697ee90eaa4dd13b0dfb86b3b53bec85')
b2sums=('12261ad708b269f2a0a906f3db96777a705f62f0539c583f62c5c856206fb5d9feb7d7c4e664b93e47a1e9ad14e8fc4e785ca69bc165dba773e3ecabf75ce96a')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biganalytics
_pkgver=1.1.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Utilities for 'big.matrix' Objects from Package 'bigmemory'"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Apache LGPL3)
depends=(
  r-biglm
  r-bigmemory
  r-foreach
)
makedepends=(
  r-bh
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('85078759889b06ac5a408175d5297560')
sha256sums=('debd18d8ed2e1a49fe25c69f8a636b955b1cabedd36ec69c0bff53b64d8eb9a5')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SharedObject
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sharing R objects across multiple R processes without memory duplication"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-rcpp
)
makedepends=(
  r-bh
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72c88a08e6e3bed0f4b4c1fdcae274ec')
b2sums=('dbc11660da1aadbdd0dcacbff9c75cc4a81d05e880c616ff4b4874376cc7ec1b8ce047bee0a44784c5f14ab9619a7a54261ca501efe92489aa6d2b929b29b2a3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SharedObject
_pkgver=1.22.0
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
md5sums=('df65479aade712fc183c9ccb85b64477')
b2sums=('33dc80482db72f5c77397a66649172e1044c34f61838091d1b79901f7d56596de8b0f067ff65fbcb7b5164e24ab12eb196d58e897abaad79239e3155d9edce3e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

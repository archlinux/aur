# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNAmodR.Data
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example data for the RNAmodR package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-experimenthub
  r-experimenthubdata
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-genomicranges
  r-knitr
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b284df71f180bfd5b4ba5daeb01ffb9b')
b2sums=('ffe546ace02a45c404cc5f2b90899dd5271214884a7fd265c36e6841bb7175abd6def098c72966e7edef81c696d327e680948c263e3fddeb494b39de8d27e8e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5
_pkgver=2.46.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R Interface to HDF5"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  curl
  openssl
  r-rhdf5filters
  r-rhdf5lib
  r-s4vectors
  zlib
)
optdepends=(
  r-bench
  r-biocparallel
  r-biocstyle
  r-bit64
  r-dplyr
  r-ggplot2
  r-knitr
  r-mockery
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('947e662fe5f427ed0cc839e8049b431e'
         'e7763c1284318e623c69572315650118')
b2sums=('6915bc95d312b394a315b55935c37e6cb4be5f6207eb46ff61c1b2933409d612cccf4920d2cc650e563959c0acfcf3b1421bdd17a72cce18034c7b0f971d0253'
        'f776cc9e80195b4e4dbfe85e0bf3da4c5dc1967219120072949e847ec725283e74293a71cd51a6d6b57dd54b5f2aae80c4150ba30cb74efdd83fb2b135ae5698')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

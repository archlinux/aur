# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qs
_pkgver=0.27.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quick Serialization of R Objects"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  lz4
  r-rapiserialize
  r-rcpp
  r-stringfish
  zstd
)
makedepends=(
  r-bh
)
optdepends=(
  r-data.table
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb62832108b6188215c612ad9fb94676')
b2sums=('7c9e0e154f3b74d0cd059a2c30433ec4934a329f60f2fe5e8b42b08ecf01730c39ba256a8898286e442c454dba39dce67bfca80fb40ea03ce70b3edfbeb51910')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

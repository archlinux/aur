# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DelayedMatrixStats
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions that Apply to Rows and Columns of 'DelayedMatrix' Objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-delayedarray
  r-iranges
  r-matrixgenerics
  r-s4vectors
  r-sparsearray
  r-sparsematrixstats
)
optdepends=(
  r-biocstyle
  r-hdf5array
  r-knitr
  r-matrixstats
  r-microbenchmark
  r-profmem
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f64661407a7d67dfcf209e85ad80a73')
b2sums=('86033d4197a7a52d505dbf99d6f6205ffb49468383f735bec5b288c405dbad81b3b83bcdb3dfdcdf6f76dd4c1ead3d67843c100e8ce032a77e26a75a3c209d42')

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

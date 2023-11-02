# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNAmodR.Data
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example data for the RNAmodR package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('cd4851e2f0c0a93c6d5a9163f542b07f')
sha256sums=('0159cb46031193ee09916fd929562a5a2c23e201bf4017b7552b0495890c3d5d')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

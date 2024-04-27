# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNAmodR.Data
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('cd4851e2f0c0a93c6d5a9163f542b07f')
b2sums=('27edb34018fb8b8a83ad11fa2a7d3111da2f4199752ad527520d9dfc9ca2642629bcace270638fadfdb2f153ff5a28915c4f894e2bdbd8d4de93848d8c6f7911')

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

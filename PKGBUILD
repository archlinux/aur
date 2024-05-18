# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RBioFormats
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R interface to Bio-Formats"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  java-runtime
  r-ebimage
  r-rjava
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a99e259b2e81747ad5d822c49d266248')
b2sums=('456583a20d04aed4017a4c905dd4404771a6f52f03de66499f9a9945ef3e0d13f6c70065f4d252181869e1837531d1e0badc179af98b6cf55a23bf98bd15fe2b')

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

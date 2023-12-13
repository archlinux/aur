# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=updateObject
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Find/fix old serialized S4 instances"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  git
  r-biocgenerics
  r-digest
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-genomicranges
  r-interactionset
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
  r-timirgen
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d69cbbcd4bd9c5f31d905a47f6af212')
sha256sums=('aaf3864680f6405523a92ecef102842f6192028c53279d63c7e34ee922ca2b28')

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

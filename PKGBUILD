# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RBioFormats
_pkgver=1.10.0
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
md5sums=('f0fdf86456f2d7da79b8b0d489defe7d')
b2sums=('66f5f44eb8caea4664899fe4903c2f569147d4f6985ab7b0ce0fa3f6e40ebe1175469f6a5609c1572811c4d10e1a50fd2774195163f0c7b543bd0c5bf0234087')

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

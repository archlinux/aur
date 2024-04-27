# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CTSV
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Identification of cell-type-specific spatially variable genes accounting for excess zeros"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-knitr
  r-pscl
  r-qvalue
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a3f8c7b5398449ea01b312ed7da1f43')
b2sums=('5bfdab247571bd0717597ab31684f7caad1446503a9185a77c6102563d6fdcff1272aba0bba7c77dce9fbf19a5cea15bb14cc1dbae1ffffe9694e2fcdb0cddd0')

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

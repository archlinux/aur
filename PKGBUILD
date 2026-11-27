# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CTSV
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('b0180c78be2b2c3c27204c3fe4a2014d')
b2sums=('655fa5e86220dcffcb280dc57d568f275a0dda536c4eb613414c6b9dfd879cc0b8838fbf083ad6c71c56fe759640ab287a10fdc91943a2a82062c5c5a30f6e15')

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

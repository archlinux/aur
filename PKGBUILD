# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.bumpy
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Save and Load BumpyMatrices to/from file"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.base
  r-biocgenerics
  r-bumpymatrix
  r-iranges
  r-rhdf5
  r-s4vectors
)
checkdepends=(
  r-digest
  r-testthat
)
optdepends=(
  r-biocstyle
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8ea7092c7e664278c2be46143fbbd64')
b2sums=('efc27b746be75d78c1bb05059e043a6056a53e132cbc19a4588d6e63d5d3b04bbaac62e98787982ca57028cfb1c93aff665370490c3911eee8d6a3e349c8729d')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

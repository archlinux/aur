# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fastreeR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Phylogenetic, Distance and Other Calculations on VCF and Fasta Files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ape
  r-data.table
  r-dynamictreecut
  r-r.utils
  r-rjava
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-knitr
  r-memuse
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f3744c0f1d467fab42b9b397e8c86320')
b2sums=('2f6e4200acc057d8644a80c64566bc6f9880a7ac1efa4403504713e2fd34bad5c8dbe62ff61a47746fb374e3e66b3d0267243192696db773155d0082783c720f')

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

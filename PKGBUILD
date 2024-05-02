# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fastreeR
_pkgver=1.8.0
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
md5sums=('46541a2b13f7dd609db30ca3c85dd07f')
b2sums=('e04fde80c2307c9cc5f4bae6b715341c742ab1b1fec69db02e599d539239fb3b2beef48b6920e20089b04979b714e90ef88e253b1ae0503b5df81ae606320420')

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

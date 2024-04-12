# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fastreeR
_pkgver=1.6.0
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
md5sums=('e2b7164aeaa305f819536d9b85e4de12')
b2sums=('773d006ed3f7ead8f6a95c179c28cc776c64a2ce07b7eb1fa8083deac2a480e3c9eb21e4942582b35bb41520401ff8a463ae64fe820aaa9aa680139a80ce27f1')

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

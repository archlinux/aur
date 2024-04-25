# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=INTACT
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Integrate TWAS and Colocalization Analysis for Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only AND AGPL-3.0-only')
depends=(
  r-bdsmatrix
  r-numderiv
  r-squarem
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d8646f4acb0cbb31ccf53a672818be40')
b2sums=('4e08edba9ecf302ea643ecf7a1cc33836f59432829ce18c0022429c4c5a2f4c58c8185f0c55dfd1c03d30eec9827f4472c668705e46e32c7735648f5671e849e')

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

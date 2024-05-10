# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=INTACT
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrate TWAS and Colocalization Analysis for Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only AND AGPL-3.0-only')
depends=(
  r-bdsmatrix
  r-numderiv
  r-squarem
  r-tidyr
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
md5sums=('cd238b9043b3eeac41774eae1f8c67fd')
b2sums=('a64ff38bc6ebf192ad51d7c6e77557258f756b22acd9775437b6280c4fa85e69368e0a4f8c93723aeee518afd01b568bc0d4091b15244872afc406ff39e7065c')

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

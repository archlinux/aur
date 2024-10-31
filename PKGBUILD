# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomAutomorphism
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute the automorphisms between DNA's Abelian group representations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-data.table
  r-doparallel
  r-dplyr
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-matrixstats
  r-numbers
  r-s4vectors
  r-xvector
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb2c2c82d65e36c8f2a95afd46b8dc03')
b2sums=('611d6cfec10cb88a0701d34269a4e5e88835015b41efd5c27fffc5c4161d2d44ca7a4f2eb571dc3d22348f14828a1308ece83933d8cde3b0f03301367fa984f5')

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

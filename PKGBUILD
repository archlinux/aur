# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomAutomorphism
_pkgver=1.6.0
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
md5sums=('8e2b819e8ccd17678ee090501fb50703')
b2sums=('54f22c18badeac9e372d53fb078b1487ec06fb566cbf3672cb55d92c1cadfed95652ff05c3cf3d8478821f6cb994a01e48370a3408ebbfcc9b9702c85b13ffde')

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

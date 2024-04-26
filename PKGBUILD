# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GenomAutomorphism
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
  r-numbers
  r-s4vectors
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
md5sums=('36ebcd90b454dc7450e875730537811b')
b2sums=('33be5f5772966e34b9a0d4a637e31cb6f5fc0c21688b82be58caaa6edcd7fc7ccc80ba1a7b30edaf79cd06b3be36342283fd1908e129261595cb0d1d7a461468')

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

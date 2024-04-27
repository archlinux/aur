# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RgnTX
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Colocalization analysis of transcriptome elements in the presence of isoform heterogeneity and ambiguity"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-regioner
  r-s4vectors
  r-txdb.hsapiens.ucsc.hg19.knowngene
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
md5sums=('4ce438a2822a6541467c9781a3c48b26')
b2sums=('bdfb1e556b164dfa16c00800a8348685221cc88b9f31122d83696869026e3b176f497289d8260a1324b59e252401bcb2cfcb3043ba17bea83a343d90ad7a0151')

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

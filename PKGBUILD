# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RgnTX
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('5569e79d566959caaf9fa785838cde42')
b2sums=('cb1b387d466f1721f41b435fd04ac02e98689cb38f1fe50ad5c2bb615c3727242aa20d1c93125f527fbe1ed60958a9ed0605c0c3477a09395d28bb61ffe3a40f')

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

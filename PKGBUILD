# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RgnTX
_pkgver=1.10.0
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
md5sums=('a0756edc1d8d2146aab082da7341e131')
b2sums=('79f6c83f77f2422cf1e06457329332a54e0a104ee89b193fb51e79fb2dc95e66bc51efe9e5c1eb563178a1fa1eb43e13b1bed920662535ae3b6008f77c23c5a7')

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

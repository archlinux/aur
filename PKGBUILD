# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cardelino
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clone Identification from Single Cell Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-combinat
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggtree
  r-matrixstats
  r-pheatmap
  r-s4vectors
  r-snpstats
  r-variantannotation
  r-vcfr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-foreach
  r-knitr
  r-pcamethods
  r-rmarkdown
  r-testthat
  r-vgam
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d059162a3cd68ef119ef9ef20db3478c')
b2sums=('01d81b3039d04780264db8dc4da888e2ee070efb400bada46557fd4ce283db6158bfd06b0863023ea27c8992fc12ccfad6feb568f1c8d256d23a093db458d91b')

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

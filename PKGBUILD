# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cardelino
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('363c06547419f29e1cdfe473651e1861')
b2sums=('9cfce3cc4484e8fc1d5085a02f16a38d2a715f4ff36dca665bbb71f5d463af2bdc7041d4903f43df321abd82d8fb473345c88acb72be3a1a3371a610dd4f4c5e')

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

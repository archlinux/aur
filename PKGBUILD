# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cardelino
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clone Identification from Single Cell Data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('f6ed2a646b833f4a63b0641731ce2c1dbc4718d76d7418c0878acb00561b8d78')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RAIDS
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Accurate Inference of Genetic Ancestry from Cancer Sequences"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Apache)
depends=(
  r-annotationdbi
  r-annotationfilter
  r-bsgenome
  r-ensembldb
  r-gdsfmt
  r-genesis
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-proc
  r-rlang
  r-s4vectors
  r-snprelate
  r-variantannotation
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-ensdb.hsapiens.v86
  r-genomeinfodb
  r-knitr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('768d047b002bb44e1178d69233878818')
sha256sums=('0208eb91f74930bbcebbec4844b708878391831b9097c0080d36cce9c78c5799')

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

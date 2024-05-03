# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RAIDS
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Accurate Inference of Genetic Ancestry from Cancer Sequences"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
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
md5sums=('68f024133092f72a434dd386f68b669c')
b2sums=('d8cf20407390fe537fd7419f8cc4f457ba67dde76c61c07ca603bd8f8b5c8722100e55666dca7925f73aa074124bfa3cf36b874944b251f57cb631b594681ad1')

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

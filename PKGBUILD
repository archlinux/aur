# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RAIDS
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('768d047b002bb44e1178d69233878818')
b2sums=('9ccb1fa9a3ec7ce7b4e5811e500e5f5f6378b7604aa92e239a13475788ea229621529a251c01de774de2fdc4b7810f1ca33270e5fd417c1841b1cd0fe4d44547')

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

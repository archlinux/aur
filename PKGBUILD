# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DNAfusion
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Identification of gene fusions using paired-end sequencing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bamsignals
  r-biocbaseutils
  r-biocgenerics
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rsamtools
  r-s4vectors
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b7ef2bb10bea5334d6d159208c284c16')
b2sums=('dd96d0d06ed4a162e894f24e9f0a759167279a23750b70e97732b5c9c5f4e388118c99aab1c405c36b1e99ffd7b8e269758e2b4b5bd80f3987f56b1cd5aa8d4c')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DNAfusion
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('a5ab00622ae7c6f6b0452af2225e8c13')
b2sums=('80a60287c7a59867d3e03d06b6e3e0ee6ae2d063d08d1d4f57f5d13ac2d8e2ccb392e7f909b55ea7dc0ad595d352415adf2866e605a8be9ee1132cf2ddc29f1f')

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

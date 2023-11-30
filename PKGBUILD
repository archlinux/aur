# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DNAfusion
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of gene fusions using paired-end sequencing"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('687e11a620c606ac02e5732f83ebdeb1c8edee1818d9ec38a84431b9d00c221d')

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

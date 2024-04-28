# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OutSplice
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Comparison of Splicing Events between Tumor and Normal Samples"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-annotationdbi
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-org.hs.eg.db
  r-repitools
  r-s4vectors
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
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
md5sums=('7a55735983a79681a2bbcd567c9f0c53')
b2sums=('d6b48f4584bc0a137aefd560d17351bf2418ca304e42ac05d9f6df75cbfb7003e4e4c3c81567fb175c3533245d5d431214bb8e5e72c5986c2118f03135e6cf1e')

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

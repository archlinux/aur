# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DNAfusion
_pkgver=1.8.0
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
md5sums=('1cda8d4924a5b43b55cff5f17ec1ade3')
b2sums=('78cd815afa2d91322060481e59386e5ea012bc185457dc58eb76740ea67615d66ec66da2d51ac4d23208872a2f40546a592d18d85930d56f172631a46c43a20c')

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

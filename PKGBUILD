# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OGRE
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Calculate, visualize and analyse overlap between genomic regions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-assertthat
  r-data.table
  r-dt
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gviz
  r-iranges
  r-rtracklayer
  r-s4vectors
  r-shiny
  r-shinybs
  r-shinydashboard
  r-shinyfiles
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4bd09d598eb2be1c4fced58fc417b8fd')
b2sums=('c9727bc42abea85ea00fb2b548ab9261223f15ab9ef5b208c952c0e7d7bd625f54316da27d9b0139a6e4770272ac154f9df3cc3522695016d890de0a2beb9711')

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

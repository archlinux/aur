# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OGRE
_pkgver=1.16.0
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
  r-seqinfo
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
md5sums=('fe5fac5c93b11989a8d912115f5fa0b7')
b2sums=('39e3c90ce041856a1ce771e58f07158ca525759a4739aee57946e6de793a9d2b752a0df2978014ddac5938d68ceeaeb79bd01586e11be58f66a5f7e120b6e8ec')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OGRE
_pkgver=1.12.0
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
md5sums=('723fdc8739adaf8b7c3716e2028a213c')
b2sums=('0ab10c1dffdeca097728809de1232308d28ed6778073567535630f2075a6d184e435f388bbdcd5f73a86081eaaa9661b1ada86f05ae23b0512e8125756d536c8')

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

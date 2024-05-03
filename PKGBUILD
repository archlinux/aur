# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OGRE
_pkgver=1.8.0
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
md5sums=('c3ca8993d930ab0808d53cd134bdc2a1')
b2sums=('98cef4857b3f24f254d702d756f0d3c7ee16aa8ff5ce1177898a44fbaf6f9e738fecabb53082cebd810b8dc5a1f9e5bc9969bebab492c7381dc984f3ddd0b0ba')

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

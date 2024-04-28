# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=OGRE
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('cff18fd2eda3eb1e67e9f7739fb9e773')
b2sums=('4eee16cbece3d8cadcdcdcd6607b80dd3b5a5b8dcde56568552eb829a6c16dc00f0f925821bb4df1e21452ea1c62862ff677a6ef6bf9b8d093449dea97d38e54')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gatom
_pkgver=1.10.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Finding an Active Metabolic Module in Atom Transition Network"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-bionet
  r-data.table
  r-ggnetwork
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-igraph
  r-intergraph
  r-mwcsr
  r-network
  r-plyr
  r-scales
  r-shinycyjs
  r-sna
  r-xml
)
checkdepends=(
  r-org.mm.eg.db
  r-reactome.db
  r-testthat
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-fgsea
  r-keggrest
  r-knitr
  r-org.mm.eg.db
  r-r.utils
  r-reactome.db
  r-readr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe12f9a4a6a2065e617e647031992047')
b2sums=('6a5b79c26a36f89fd8b0ab8706c4866becbddb36db5c2772cb38e45ed70e1ec55009a70e41790fe700bfee7234a780d0215f4beaea29e79c3f223a549dd4aec3')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname"
}

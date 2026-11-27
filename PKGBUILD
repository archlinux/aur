# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gatom
_pkgver=1.12.0
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
md5sums=('1b62da7c4fe025478fe89005a79695eb')
b2sums=('dfed4f8eb6efcda001a2b97339a26760c5139320d8b661117442ce39fdc7add144606f3e67875ff9925a7e06b0115ab0e98083252a9938de38886fba28359187')

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

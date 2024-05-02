# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gatom
_pkgver=1.2.0
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
  r-ggally
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-igraph
  r-intergraph
  r-mwcsr
  r-network
  r-plyr
  r-pryr
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
md5sums=('e3861da00bd8a76677fbef482690690c')
b2sums=('505051b52915ac697fbedeeb315d93af2a23cb3379219b52eff918cad86987cb8965f7ac46c8fed66cd8188530a9d2da3a1f231983e9222a546abc6bcef8305c')

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

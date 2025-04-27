# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEhub
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE for the Bioconductor ExperimentHub"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biocmanager
  r-dt
  r-experimenthub
  r-isee
  r-rintrojs
  r-s4vectors
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-nullrangesdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-nullrangesdata
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9a77167351499afc6b1a5aeed34e22f')
b2sums=('70c5eea1dbf75390de77214b74d519b29d309fd21f1adb15fb1e80c5775b3a998a0c2805b9ee23002456328b5e5ce304af193eaf8917be78146443e7047669bd')

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

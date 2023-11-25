# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEde
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE extension for panels related to differential expression analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-deseq2
  r-edger
  r-isee
  r-s4vectors
  r-shiny
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-airway
  r-biocstyle
  r-covr
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-refmanager
  r-rmarkdown
  r-scuttle
  r-sessioninfo
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4d6215b9243635ed9dd3b6fcf5cbf166')
sha256sums=('9cc20577ff9d5a98e2116dc0981f02885c0a620fd5ce3b887299c52c68332295')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

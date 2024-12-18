# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lineagespot
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detection of SARS-CoV-2 lineages in wastewater samples using next-generation sequencing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-data.table
  r-httr
  r-matrixgenerics
  r-stringr
  r-summarizedexperiment
  r-variantannotation
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-refmanager
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('16869e44569c6f2e5fa2780ccbb0dfc2')
b2sums=('538d57e6ace1ad67644bc0eba7bddf981056eb9334761f65037bd1e655879fdcc92c3bbcb56f203eaa64a5a1b047a66c4ea58628085e42492c734f9d7da5fdc3')

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
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

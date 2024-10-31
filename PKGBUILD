# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=metabinR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Abundance and Compositional Based Binning of Metagenomes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rjava
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-cvms
  r-data.table
  r-dplyr
  r-ggplot2
  r-gridextra
  r-knitr
  r-r.utils
  r-rmarkdown
  r-sabre
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ecee6cce174068c7c3f1eb3700327ea')
b2sums=('317cdb5e5a2d37b995d9f03270cfc4540d5a947ff42161fda73bd35437b0180af087e52b2801a8287563aa94e3417f8944bba2a5d4a365d23fb9848680d215ee')

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

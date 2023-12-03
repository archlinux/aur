# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PanViz
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrating Multi-Omic Network Data With Summay-Level GWAS Data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-colorspace
  r-data.table
  r-dplyr
  r-easycsv
  r-futile.logger
  r-igraph
  r-magrittr
  r-rcolorbrewer
  r-rentrez
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-networkd3
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d5ced4ee7d68f57367aed30633f29e0')
sha256sums=('a05161ea6299e1426430c604c4e6ce050aa4b528b8d32c32f5fe43d8522b52a5')

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

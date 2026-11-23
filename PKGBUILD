# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggmanh
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization Tool for GWAS Result"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-gdsfmt
  r-ggplot2
  r-ggrepel
  r-magrittr
  r-paletteer
  r-pals
  r-rcolorbrewer
  r-rlang
  r-scales
  r-seqarray
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-genomicranges
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5b5da1cde85353e5ef8d1357c4eb33cc')
b2sums=('c77e9ee99fad1a5f92ab43bd7eb1b4ddfe6d2fec0388ce53d37acb99d04e22e588d3989f0a05813bde13fd12fc146e1a5e8468e2d0b035d4c7ba98da233d91eb')

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

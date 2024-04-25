# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PanViz
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Integrating Multi-Omic Network Data With Summay-Level GWAS Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
b2sums=('4ba8baaeebaef37d8846e76d4c91652d96b992976e43d80f5785f5e3f12968152c8768ec2746280e6770640f0d36539c4198b32c75724be40cf3416b3cc2e3fb')

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

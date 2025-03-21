# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=enrichViewNet
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="From functional enrichment results to biological networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dose
  r-enrichplot
  r-gprofiler2
  r-jsonlite
  r-rcy3
  r-strex
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
  r-magick
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('24bfac4e66bb94854260dd6a535e7c6e')
b2sums=('7cb7cc159831913b2a9d407a187d6365026d6a839767b937be797850d76d2f907e46ae85953177f2d6d268850dd902cd3efe9ff8f0d5f3f09f1cc055660d8a10')

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

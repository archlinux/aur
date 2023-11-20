# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compSPOT
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="compSPOT: Tool for identifying and comparing significantly mutated genomic hotspots"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-data.table
  r-ggplot2
  r-ggpubr
  r-gridextra
  r-magrittr
  r-plotly
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7aa69c9c3ec0c008ad0fdfb4dbbcac57')
sha256sums=('6b11254933cfd20fc3aae611e9d38d7c6ef10e0a7251f06847b9cb48e4c61a8f')

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

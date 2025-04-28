# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggkegg
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analyzing and visualizing KEGG information using the grammar of graphics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocfilecache
  r-data.table
  r-dplyr
  r-ggplot2
  r-ggraph
  r-gtable
  r-igraph
  r-magick
  r-patchwork
  r-shadowtext
  r-stringr
  r-tibble
  r-tidygraph
  r-xml
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bnlearn
  r-clusterprofiler
  r-knitr
  r-rmarkdown
  r-testthat
  r-annotationdbi
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6fb58e5532b3978348b0b1a9ab57a2ad')
b2sums=('39fb158aa736d7eb6e58be970a25504e7b067bf726bde3466f31670d00a6e06bdb727bb54d3267b6ca465882538cb7474bc3411e313be0573553e04cf20dbd7c')

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

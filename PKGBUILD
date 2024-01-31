# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggkegg
_pkgver=1.0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="KEGG pathway visualization by ggplot2"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-biocfilecache
  r-cairo
  r-data.table
  r-dplyr
  r-getoptlong
  r-ggplot2
  r-ggraph
  r-igraph
  r-magick
  r-org.hs.eg.db
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98dc6caba694d4344536027979cb43f5')
b2sums=('ebbbe929144bafbae1db34c474c82cd032182d97a09539567ba96d33def60d838cd1bb5b9f26d44c031f8b0fb5bb6edba01969ef77b54228771bf3451d93bd48')

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

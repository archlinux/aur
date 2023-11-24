# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggkegg
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="KEGG pathway visualization by ggplot2"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('747219ce420df145e10ee4b9243b17dc')
sha256sums=('5e1e4b9a9b9f88c48b504c285176bd873a760b38d5966916009af06320b27602')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

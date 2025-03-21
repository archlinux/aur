# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggkegg
_pkgver=1.4.1
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
md5sums=('32c248e3d12bd305dbd394d938f00d27')
b2sums=('5a2b57b7c5f7d92de9b3ea4f86db387d920dc9f9b305980cb598bca119705d7648bf50dd532a411c1a410f0dbd00bf17280539157584945e7fc389c37bab717f')

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

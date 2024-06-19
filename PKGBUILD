# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggkegg
_pkgver=1.2.1
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
  r-data.table
  r-dplyr
  r-getoptlong
  r-ggplot2
  r-ggraph
  r-gtable
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
md5sums=('4b34f0b835bdef08562610072e2a89cf')
b2sums=('80266a4cbf7022d7093acf256e985a9e56e7ee24e8df91c823813f517adb487aa66c8b95dd574c499be33cf47c91b4df1ad0def89fadf790ec5f257f741ea14b')

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

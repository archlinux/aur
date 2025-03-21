# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PanomiR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detection of miRNAs that regulate interacting groups of pathways"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-clusterprofiler
  r-dplyr
  r-forcats
  r-gseabase
  r-igraph
  r-limma
  r-metap
  r-org.hs.eg.db
  r-preprocesscore
  r-rcolorbrewer
  r-rlang
  r-tibble
  r-withr
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
md5sums=('96e2c9bf2bd7d1d628a360579b66a77d')
b2sums=('b0749c63b479d7388d37b04e8c970512fd54493acdba5897f1b4a0876a990a185331822c902719eb680c19131d1fed4a8902323c8d7f52b9be29189ebf30449c')

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

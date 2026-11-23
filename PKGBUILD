# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PanomiR
_pkgver=1.16.0
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
md5sums=('2cc706d2ff9c806a7ced31a5bd27aa0c')
b2sums=('f904a452cb4971cc43edac0c8dabcde736d91f2f46135c1a93cf7650d8f4b5afe48dc086996d31cc4b791d58d4180baa98f3c698e614c11aabe644a2bcd0c575')

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

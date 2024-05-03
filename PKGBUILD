# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PanomiR
_pkgver=1.8.0
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
md5sums=('0add6cf72450177b163ceced1eaa5fae')
b2sums=('a847608628ae2664a22cd88ca1f4c4d09a7f81889c4d9bff0fae35ab4ce05476deb0ec6dd6a0917d4277525f26cb841150e8fcf30dc81dd010e9d46ff6e5e275')

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

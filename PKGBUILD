# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ScreenR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package to Perform High Throughput Biological Screening"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-edger
  r-ggplot2
  r-ggvenn
  r-limma
  r-magrittr
  r-patchwork
  r-purrr
  r-rlang
  r-scales
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('13bbdf2b6eeb014b53b20cd02e4e9f0d')
b2sums=('1ba161a6ef99d0dd4a95af7fc346557d32948b630fe1d1215a74585725d08a251395d30619637a87406b9c5906ef846076eb349a3a18f9aa8e779ff7c14b6992')

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

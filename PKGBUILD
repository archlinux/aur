# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ScreenR
_pkgver=1.14.0
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
md5sums=('ecd48cc5e2c98fc05d6214e527525d20')
b2sums=('01613e8d6f720440b46935aa8d6c9aa6ceb53c14adf8ea7c24f8a7f8d3148cf8d18e6451831045b91e82f4bc49df09d21021b701dd3c09eeb4101020f8943f5d')

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

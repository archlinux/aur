# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gg4way
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="4way Plots of Differential Expression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-deseq2
  r-dplyr
  r-edger
  r-ggplot2
  r-ggrepel
  r-glue
  r-janitor
  r-limma
  r-magrittr
  r-purrr
  r-rlang
  r-scales
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-airway
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c85125a8df2d8d71dfa4892b9d815865')
b2sums=('ec3b15bc8b368204fc860c318b5864d2f1e45e868d95791e314b0aeb666a4f4c0300c5336f5ff47ff4db265bc67fecabbebe4795b7ff0e08436a6e72ea6d80cb')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gg4way
_pkgver=1.12.0
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
  r-vdiffr
)
optdepends=(
  r-airway
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a60ee7312e9371fd70a028b558a343e')
b2sums=('39cf9acb64087d07a43956667f70032ff0d694fc55b9ba9b08a01c48de0f61c8371df46e7ab138c2b99e04b3a1c6eca916bc130267382ffbbc0b95206c620418')

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

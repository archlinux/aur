# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gg4way
_pkgver=1.10.0
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
md5sums=('11ba137da14e60d8d1ecea73f20e2fd5')
b2sums=('623246c8171b4b4d3839c38e53e015138c3bb8d832b0ece62c5c736d65124bb6d6f8d853d6050d693976bb6b89271279ff955c491b9f018e2393c043c7c95011')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TREG
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for finding Total RNA Expression Genes in single nucleus RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-purrr
  r-rafalib
  r-summarizedexperiment
)
checkdepends=(
  r-dplyr
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-dplyr
  r-ggplot2
  r-knitr
  r-pheatmap
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-singlecellexperiment
  r-testthat
  r-tibble
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bf013b8aee9f43f49c172faae41f0236')
b2sums=('b5926854209e5a8f1453a66bd45377d75c25a5a49881ae1be0d7b51f37ec53d6ce5b7a6a823d4795d526a37912d68a1f26d1124ed6b7661c4bd5414162f748d7')

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
}

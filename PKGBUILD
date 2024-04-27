# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TREG
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('d76ba3f3707e1810e6491d04013d6e7b')
b2sums=('9f96770c568375aa2c9c207db73caaacaf69b10a4dfc2fd40b782b021b02e26333411b6491d1d95963bea5b10e9cf2c14bbf3987f1563bebfd5f78ea68c4e953')

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

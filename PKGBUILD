# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNAseqCovarImpute
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Impute Covariate Data in RNA Sequencing Studies"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biobase
  r-biocparallel
  r-dplyr
  r-edger
  r-foreach
  r-limma
  r-magrittr
  r-mice
  r-rlang
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-stringr
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17d14273ae359562d3f0cbf1c45b10a7')
sha256sums=('f163be9e6155e9d27b2f06c8326b3c0691ad05525d2598ad1187e6925310d65e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

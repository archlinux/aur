# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNAseqCovarImpute
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Impute Covariate Data in RNA Sequencing Studies"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-biocgenerics
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
  r-pcatools
  r-rmarkdown
  r-stringr
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c393bd4177d5bab473ed5e53e4f8118a')
b2sums=('c238d04201d517092d40472b18ed1d075d91b909f55e49ad8956ae51e663f70e0c4c5d258f97304ee8e5b52df0f5a3d218b192548b8c8177776be75ebaaee2ad')

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

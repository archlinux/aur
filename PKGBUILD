# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNAseqCovarImpute
_pkgver=1.2.0
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
md5sums=('0ec9872567c7b1063c7d9fb1f20a3517')
b2sums=('c2a263fd3922a217da2be63f8d43b4cea88792014abcaa97a2f89279898e09581fe706e10375315e847a557c2a1f3b21b896025db04a49b41e135a19e01fc962')

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

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNAseqCovarImpute
_pkgver=1.4.0
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
md5sums=('2b8770546c6f7feeacc2935c0db3065a')
b2sums=('1a72daaf5531b9a9aac3410362d05ae55a004fd3abec71ed86562245dec78fdd39b5b29f6f00078f29f8c4493a7b6b8938a1eca679c237160207c04d61f5b1e3')

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

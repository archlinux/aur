# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BOBaFIT
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Refitting diploid region profiles using a clustering procedure"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-dplyr
  r-genomicranges
  r-ggbio
  r-ggforce
  r-ggplot2
  r-magrittr
  r-nbclust
  r-plyranges
  r-stringr
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('05eeacc049e8d4eb8ae3918b85ac3963')
b2sums=('03b037c41614eeb8d07e1f1b32381145ee171285ddbed50011a86f99a986ede72fd873d43d60014b85de599f7c1d63c29c6beaa8db2d91e684b2bb928276dac4')

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

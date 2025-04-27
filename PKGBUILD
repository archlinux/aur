# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BOBaFIT
_pkgver=1.12.0
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
md5sums=('ed9a7ef0e6e268716e67e0f9cc3f551c')
b2sums=('9bc606c10111293eb83f91bef821effa47aa3a0906263f066c1e415d2052f2dcb8b799769d6316b73b3ea243041f5f24b86feb91179488966edb278f48bca151')

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

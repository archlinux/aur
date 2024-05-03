# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BOBaFIT
_pkgver=1.8.0
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
md5sums=('5ad8c50ff4223fc94a016cf29a0fa8f8')
b2sums=('43e82ac84e01f84e40174658cddfdf488c0710cbbc2041e3d575e07f1914f1cec929bd444f890130535d7ed17e8c6824c227f60e82b7d5c6fd99a5fc706cfc01')

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

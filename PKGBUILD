# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCDOC
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A/B compartment detection and differential analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biocgenerics
  r-biocparallel
  r-cowplot
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-gtools
  r-interactionset
  r-multihiccompare
  r-pbapply
  r-rcpp
  r-s4vectors
  r-summarizedexperiment
  r-zlibbioc
  zlib
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea5a91a9be89ec89bfca0613aa52816a')
b2sums=('96bb7c9c329686c425aed6fcce393e84622926c35113cb367ca122aa0967b629dbe9a5e452257fbf79098760d78c250a686e956a79255c143f3b165f0df820c7')

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

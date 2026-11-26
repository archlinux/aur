# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.mae
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Load and Save MultiAssayExperiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.base
  r-alabaster.se
  r-jsonlite
  r-multiassayexperiment
  r-rhdf5
  r-s4vectors
)
checkdepends=(
  r-biocparallel
  r-digest
  r-testthat
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b267f74a6c69bad4d1e86577ef2efdf8')
b2sums=('d103ca083ff845c1e7c2afaf48efdfa8e6f66f2a0929559664ebf3460a858106d81dac1f41529dccd4719b8e9ac32aa67f5acdaa60be5c03d4f2e595a83340d9')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=NetActivity
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute gene set scores from a deep learning framework"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-airway
  r-delayedarray
  r-delayedmatrixstats
  r-deseq2
  r-netactivitydata
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-fletcher2013a
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aee224387f9df720b12309541d2953c7')
b2sums=('8a615ccf7ac2c77d8a1b90f6062611a64ff3aed3a4349f4edcc4b914e8a2c4bf4084c2892826809793c4b71c7f98d6645a5374ffe2c6afe738a17b4c666fdb44')

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

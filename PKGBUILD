# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=NetActivity
_pkgver=1.10.0
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
md5sums=('cccfd27668529198cd5cc1bc83566c73')
b2sums=('7a7ac96913b773015326583a7a419f151cda44490a857878effdff9e5de11c8364a833df337631109c7e7aa386729c30434bbcf8abb993e2b96c4fc0dd6523b1')

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

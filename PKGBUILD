# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=NetActivity
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('3493b441d888adf6d3a089936bbeafd6')
b2sums=('cdb5973bb6d24d9f50a0330892c08383d57641be6c5fcf341c4291b28e337ad046a5111c73c179ba53bf159217f2600abf5c5f6559b5126e5984416d4ee51bbf')

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

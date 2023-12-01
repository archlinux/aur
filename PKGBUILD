# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=NetActivity
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute gene set scores from a deep learning framework"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
sha256sums=('93e4b6bfe258f29d9d6123dfc0f0aaf332e537211025a4d6c975ee624032324a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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

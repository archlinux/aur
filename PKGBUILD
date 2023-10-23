# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=marinerData
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ExperimentHub data for the mariner package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-experimenthub
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-experimenthubdata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('88417144bbc4ae0164445918ce73376d')
sha256sums=('0c0f0e94dc448ac86bbafe056b2f787fb766608f3a607f28e26dfa9012f85867')

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
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=easylift
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="An R package to perform genomic liftover"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocfilecache
  r-genomeinfodb
  r-genomicranges
  r-r.utils
  r-rtracklayer
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-iranges
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('86d8c0188c35ab56732fd5cc55475e8c')
b2sums=('d91e688d8c0a57b04f9bda2dd03d1fe34336783033405a8545c4dd9bc77f7061beb6bc9127d2cef1ac696eb6441f303242033b3398afea8d43728f2e5553f160')

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

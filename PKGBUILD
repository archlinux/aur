# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=easylift
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('ffc5f970619f6de99418696f4534c2c6')
b2sums=('c67003752d06c362dce84181a4f864748a6c52146b8134c2bc28eefda61dc16683b35a08a76a502cfe2c436d71174185258e00f7d71eb477a5e8479ed4c8aea8')

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

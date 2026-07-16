# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=easylift
_pkgver=1.10.0
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
md5sums=('452a62c94c882f655ae7bc9e76eb7092')
b2sums=('50596eb8688573718bf56499309004494b413e58995f705904e6eb928e56f0cec680b050139cc1c669ee8a03d3522f3ad57b7508c644b94d3bbf87c2c7ee1078')

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
